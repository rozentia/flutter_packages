import 'package:quiver/iterables.dart';

extension ListStringExtensions on List<String> {
  Iterable<List<String>> chunk(int by) => partition(this, by ?? length);
}
