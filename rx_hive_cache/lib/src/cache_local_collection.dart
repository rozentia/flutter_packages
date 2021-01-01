import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:observable_ish/observable_ish.dart';

class CacheLocalCollection<T> {
  final Box<T> _box;
  // final Future<Map<dynamic, T>> Function() _addOrUpdateAll;
  // final Future<T> Function(F id) _addOrUpdateSingle;
  // final bool Function(T current, T fetched) _compare;
  final RxValue<Iterable<T>> rxValue;

  Iterable<T> get value => rxValue.value;

  CacheLocalCollection._({
    @required Box<T> box,
    @required bool Function(T current, T fetched) compare,
  })  : assert(box != null),
        assert(compare != null),
        _box = box,
        rxValue = RxValue<Iterable<T>>() {
    _updateRxValue();
    _box.watch().listen((_) => _updateRxValue());
  }

  static Future<CacheLocalCollection<K>> register<K>({
    @required String boxName,
    TypeAdapter<K> adapter,
    bool Function(K current, K fetched) compare,
    HiveCipher cipher,
    K defaultValue,
    HiveInterface hiveInterface,
  }) async {
    final HiveInterface hive = hiveInterface ?? Hive;
    if (adapter != null && !hive.isAdapterRegistered(adapter.typeId)) {
      hive.registerAdapter<K>(adapter);
    }
    final Box<K> box = await hive.openBox(
      boxName,
      encryptionCipher: cipher,
    );

    return CacheLocalCollection<K>._(
      box: box,
      compare: compare,
    );
  }

  T get(dynamic key) => _box.get(key);

  Future<void> put(dynamic key, T value) async {
    await _box.put(key, value);
    _updateRxValue();
  }

  void _updateRxValue() => rxValue.value = _box.values;

  Future<void> clear() async => _box.clear();
}
