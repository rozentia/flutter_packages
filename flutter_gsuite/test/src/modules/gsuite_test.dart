import 'package:flutter_test/flutter_test.dart';
import 'package:googleapis/classroom/v1.dart';
import '../../config/config.dart';

void main() async {
  group('gsuite', () {
    test('get authorization token regular test user 1', () async {
      final client = await regularTestClient1();
      final result = await ClassroomApi(client).courses.list();
      expect(result.courses?.length, 0);
    });
    test('get authorization token regular test user 2', () async {
      final client = await regularTestClient2();
      final result = await ClassroomApi(client).courses.list();
      expect(result.courses?.length, 0);
    });
    test('get authorization token gsuite test user 1', () async {
      final client = await gesuiteTestClient1();
      final result = await ClassroomApi(client).courses.list();
      expect(result.courses?.length, 0);
    });
  });
}
