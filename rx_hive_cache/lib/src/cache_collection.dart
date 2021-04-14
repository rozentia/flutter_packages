import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:observable_ish/observable_ish.dart';

/// Reactive cache class for collection values to be stored in its own hive box.
class CacheCollection<T, F> {
  final Box<T> _box;
  final Future<Map<dynamic, T>> Function() _fetchAll;
  final Future<T> Function(F id) _fetchSingle;
  final bool Function(T current, T fetched) _compare;
  final RxValue<Iterable<T>> rxValue;

  /// The entire collection of cached values
  Iterable<T> get value => rxValue.value;

  CacheCollection._({
    required Box<T> box,
    required Future<Map<dynamic, T>> Function() fetchAll,
    required Future<T> Function(F id) fetchSingle,
    required bool Function(T current, T fetched) compare,
  })   : _box = box,
        _fetchAll = fetchAll,
        _fetchSingle = fetchSingle,
        _compare = compare,
        rxValue = RxValue<Iterable<T>>([]) {
    _updateRxValue();
    _box.watch().listen((_) => _updateRxValue());
  }

  /// Registers a new cached collection of values that will be stored in the provided [box]
  /// and will be updated using either the [fetchAll] or the [fetchSingle] futures.\
  /// The hive [adapter] for the values to cache is required to register in the [hiveInterface] singleton.\
  /// If [cipher] is provided, the box will be cipher protected.\
  /// The [compare] function will be user to determine synchronization with cached values.\
  static Future<CacheCollection<K, S>> register<K, S>({
    required String boxName,
    required TypeAdapter<K> adapter,
    required Future<Map<dynamic, K>> Function() fetchAll,
    required Future<K> Function(S id) fetchSingle,
    required bool Function(K current, K fetched) compare,
    HiveCipher? cipher,
    K? defaultValue,
    HiveInterface? hiveInterface,
  }) async {
    final HiveInterface hive = hiveInterface ?? Hive;
    if (!hive.isAdapterRegistered(adapter.typeId)) {
      hive.registerAdapter<K>(adapter);
    }
    final Box<K> box = await hive.openBox(
      boxName,
      encryptionCipher: cipher,
    );

    return CacheCollection<K, S>._(
      box: box,
      fetchAll: fetchAll,
      fetchSingle: fetchSingle,
      compare: compare,
    );
  }

  void _updateRxValue() => rxValue.value = _box.values;

  /// Replaces all currently cached values with the ones returned from the fetchAll future
  Future<void> updateAll() async {
    final response = await _fetchAll();
    _box.putAll(response);
  }

  /// Fetch values for the provided [ids] and stores them in cache if compare function returns true
  Future<void> updateSome(List<F> ids) async {
    for (final id in ids) {
      optionOf<T>(_box.get(id)).fold(
        //= no value present
        () async => _box.put(id, await _fetchSingle(id)),
        //= compare present value with fetched
        (current) async {
          final T fetched = await _fetchSingle(id);
          if (!_compare(current, fetched)) {
            _box.put(id, fetched);
          }
        },
      );
    }
    _updateRxValue();
  }

  /// Removes all the cached values
  Future<void> clear() async => _box.clear();
}
