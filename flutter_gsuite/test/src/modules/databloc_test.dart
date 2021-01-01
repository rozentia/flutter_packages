import 'package:flutter_gsuite/src/modules/databloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('databloc', () {
    final initialTestValues = List.generate(5, (i) => 'Item $i');
    final injectedTestValues = List.generate(5, (i) => 'Item ${i + 5}');
    test('should create an empty DataBloc', () async {
      //= arrange
      final emptyDataBloc = DataBloc<String>();
      //= act
      final value = emptyDataBloc.valueList;
      await emptyDataBloc.fetchMore();
      final valueAfter = emptyDataBloc.valueList;
      //= assert
      expect(value.isEmpty, true);
      expect(value, valueAfter);
    });
    test(
        'should create a DataBloc with initial values and no fetchMore function',
        () {
      //= arrange
      final prefilledDataBloc =
          DataBloc<String>(initialData: initialTestValues);
      //= act
      final values = prefilledDataBloc.valueList;
      prefilledDataBloc.fetchMore();
      final valuesAfter = prefilledDataBloc.valueList;
      //= assert
      expect(values.length, valuesAfter.length);
      expect(values.isNotEmpty, true);
      expect(values, valuesAfter);
    });
    test('should create a DataBloc and react when fetch more is called',
        () async {
      //= arrange
      final prefilledReactiveDataBloc = DataBloc(
        initialData: initialTestValues,
        fetchMore: () => Future.value(injectedTestValues),
      );
      //= act
      final values = prefilledReactiveDataBloc.valueList.toList();
      await prefilledReactiveDataBloc.fetchMore();
      final valuesAfter1 = prefilledReactiveDataBloc.valueList.toList();
      //= assert
      expect(values.length, initialTestValues.length);
      expect(valuesAfter1.length,
          initialTestValues.length + injectedTestValues.length);
      expect(valuesAfter1.last, injectedTestValues.last);
    });
  });
}
