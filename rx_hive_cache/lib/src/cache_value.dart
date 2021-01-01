import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:observable_ish/observable_ish.dart';

class CacheValue<T> {
  final Box<dynamic> _box;
  final Future<T> Function() _fetch;
  final String _valueKey;
  final RxValue<T> rxValue;
  final T _defaultValue;

  T get value => rxValue.value;

  CacheValue._({
    @required Box<dynamic> box,
    @required Future<T> Function() fetch,
    @required String valueKey,
    T defaultValue,
  })  : assert(box != null),
        assert(fetch != null),
        assert(valueKey != null && valueKey.isNotEmpty),
        _box = box,
        _fetch = fetch,
        _valueKey = valueKey,
        _defaultValue = defaultValue,
        rxValue = RxValue<T>() {
    _updateRxValue();
    _box.watch().listen((_) => _updateRxValue());
  }

  static Future<CacheValue<K>> register<K>({
    @required String boxName,
    @required Future<K> Function() fetch,
    @required String valueKey,
    HiveCipher cipher,
    K defaultValue,
    HiveInterface hiveInterface,
  }) async {
    final HiveInterface hive = hiveInterface ?? Hive;
    final Box<dynamic> box = await hive.openBox(
      boxName,
      encryptionCipher: cipher,
    );

    return CacheValue<K>._(
      box: box,
      fetch: fetch,
      valueKey: valueKey,
    );
  }

  void _updateRxValue() =>
      rxValue.value = _box.get(_valueKey, defaultValue: _defaultValue) as T;

  Future<void> update() async {
    final response = await _fetch();
    _box.put(_valueKey, response);
  }

  Future<void> clear() async {
    _box.delete(_valueKey);
    _updateRxValue();
  }
}
