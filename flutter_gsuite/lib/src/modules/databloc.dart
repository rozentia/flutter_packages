import 'dart:async';
import 'dart:developer';

import 'package:flutter_gsuite/src/constants/constants.dart';
import 'package:observable_ish/observable_ish.dart';

class DataBloc<T> {
  T dataType;
  final RxList<T> valueList;
  Set<T> get valueSet => valueList.toSet();
  final FutureOr<Iterable<T>> Function() _fetchMore;

  DataBloc({
    Iterable<T> initialData = const [],
    FutureOr<List<T>> Function() fetchMore,
  })  : _fetchMore = fetchMore,
        valueList = RxList<T>()..addAll(initialData);

  Future<void> fetchMore() async {
    if (_fetchMore == null) return;
    try {
      final newValues = await _fetchMore();
      valueList.addAll([...newValues]);
    } catch (e) {
      log(
        'error',
        name: logSrc(['dataBloc', 'fetchMore']),
        error: e,
      );
      rethrow;
    }
  }
}
