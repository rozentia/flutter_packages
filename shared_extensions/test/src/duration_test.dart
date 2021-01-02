// ignore_for_file: non_constant_identifier_names
// ignore_for_file: constant_identifier_names
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_extensions/shared_extensions.dart';

void main() {
  group('duration extensions', () {
    const one_hour = 1;
    const one_minute = 1;
    const some_hours = 3;
    const half_an_hour = 30;
    const some_minutes = 5;
    const quarter_to = 45;
    const some_seconds = 10;

    const _some_minutes = Duration(minutes: some_minutes);
    const _single_minute = Duration(minutes: one_minute);
    const _hour_n_half = Duration(hours: one_hour, minutes: half_an_hour);
    const _almost_zero = Duration(seconds: some_seconds);
    const _quarter_to_hour = Duration(hours: some_hours, minutes: quarter_to);
    test('return string representation of the duration in HM format', () {
      //= act
      final hm_some_minutes = _some_minutes.timeSpanHM;
      final hm_hour_n_half = _hour_n_half.timeSpanHM;
      final hm_almost_zero = _almost_zero.timeSpanHM;
      final hm_quarter_to_hour = _quarter_to_hour.timeSpanHM;
      //= assert
      // print(hm_some_minutes);
      // print(hm_hour_n_half);
      // print(hm_almost_zero);
      // print(hm_quarter_to_hour);
      expect(hm_some_minutes, '${some_minutes}m');
      expect(hm_hour_n_half, '${one_hour}h ${half_an_hour}m');
      expect(hm_almost_zero, '0m');
      expect(hm_quarter_to_hour, '${some_hours}h ${quarter_to}m');
    });
    test('return string representation of the duration in HHMM format', () {
      //= act
      final hhmm_some_minutes = _some_minutes.timeSpanHHMM;
      final hhmm_single_minute = _single_minute.timeSpanHHMM;
      final hhmm_hour_n_half = _hour_n_half.timeSpanHHMM;
      final hhmm_almost_zero = _almost_zero.timeSpanHHMM;
      final hhmm_quarter_to_hour = _quarter_to_hour.timeSpanHHMM;
      //= assert
      // print(hhmm_some_minutes);
      // print(hhmm_single_minute);
      // print(hhmm_hour_n_half);
      // print(hhmm_almost_zero);
      // print(hhmm_quarter_to_hour);
      expect(hhmm_some_minutes, '$some_minutes minutos');
      expect(hhmm_single_minute, '$one_minute minuto');
      expect(hhmm_hour_n_half, '$one_hour hora $half_an_hour minutos');
      expect(hhmm_almost_zero, '0 minutos');
      expect(hhmm_quarter_to_hour, '$some_hours horas $quarter_to minutos');
    });
  });
}
