extension ExtendedNullableIterable<T> on Iterable<T?> {
  Iterable<T> get clean => where((element) => element != null).cast<T>();
}

extension ExtendedNullableList<T> on List<T?> {
  List<T> get clean => where((element) => true).clean.toList();
}
