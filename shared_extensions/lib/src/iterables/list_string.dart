import 'package:quiver/iterables.dart';

extension SharedExtensionListString on List<String> {
  Iterable<List<String>> chunk(int by) => partition(this, by);
}
