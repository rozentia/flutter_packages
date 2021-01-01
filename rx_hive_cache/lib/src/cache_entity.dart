import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:observable_ish/observable_ish.dart';

class CacheEntity<T> {
  final Box<dynamic> _box;
  final Future<T> Function() _fetch;
  final String _valueKey;
  final RxValue<T> rxValue;
  final T _defaultValue;

  T get value => rxValue.value;

  CacheEntity._({
    @required Box<dynamic> box,
    @required TypeAdapter<T> adapter,
    @required Future<T> Function() fetch,
    @required String valueKey,
    T defaultValue,
  })  : assert(box != null),
        assert(adapter != null),
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

  static Future<CacheEntity<K>> register<K>({
    @required String boxName,
    @required TypeAdapter<K> adapter,
    @required Future<K> Function() fetch,
    @required String valueKey,
    HiveCipher cipher,
    K defaultValue,
    HiveInterface hiveInterface,
  }) async {
    final HiveInterface hive = hiveInterface ?? Hive;
    if (!hive.isAdapterRegistered(adapter.typeId)) {
      hive.registerAdapter<K>(adapter);
    }
    final Box<dynamic> box = await hive.openBox(
      boxName,
      encryptionCipher: cipher,
    );

    return CacheEntity<K>._(
      box: box,
      adapter: adapter,
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
