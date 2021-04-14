import 'package:hive/hive.dart';
import 'package:observable_ish/observable_ish.dart';

class CacheLocalValue<T> {
  final Box<dynamic> _box;
  final String _valueKey;
  final RxValue<T?> rxValue;
  final T? _defaultValue;

  T? get value => rxValue.value;

  CacheLocalValue._({
    required Box<dynamic> box,
    required String valueKey,
    T? defaultValue,
  })  : _box = box,
        _valueKey = valueKey,
        _defaultValue = defaultValue,
        rxValue = RxValue<T?>(defaultValue) {
    _updateRxValue();
    _box.watch().listen((_) => _updateRxValue());
  }

  static Future<CacheLocalValue<K>> register<K>({
    required String boxName,
    required String valueKey,
    HiveCipher? cipher,
    K? defaultValue,
    HiveInterface? hiveInterface,
  }) async {
    final HiveInterface hive = hiveInterface ?? Hive;
    final Box<dynamic> box = await hive.openBox(
      boxName,
      encryptionCipher: cipher,
    );

    return CacheLocalValue<K>._(
      box: box,
      valueKey: valueKey,
    );
  }

  void _updateRxValue() => rxValue.value = _box.get(_valueKey, defaultValue: _defaultValue) as T?;

  Future<void> update(T value) async {
    await _box.put(_valueKey, value);
    _updateRxValue();
  }

  Future<void> clear() async {
    _box.delete(_valueKey);
    _updateRxValue();
  }
}
