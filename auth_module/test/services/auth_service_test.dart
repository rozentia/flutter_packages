import 'dart:convert';

import 'package:auth_module/models/credential.m.dart';
import 'package:auth_module/services/auth_service/auth_api.s.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:async/async.dart';

class MockClient extends Mock implements Client {}

void main() {
  MockClient client;
  AuthAPIService sut;

  setUp(() {
    client = MockClient();
    sut = AuthAPIService('http:baseUrl', client);
  });

  group('Sign In', () {
    final credential = Credential(
      type: AuthType.email,
      email: 'email@email.com',
      password: 'password',
    );
    test('should return when status code is not 200', () async {
      //= arrange
      when(client.post(any, body: anyNamed('body')))
          .thenAnswer((_) async => Response('{}', 404));
      //= act
      final Result<String> result = await sut.signIn(credential);
      //= assert
      expect(result, isA<ErrorResult>());
    });
    test('should return when status code is not 200 but json is malformed',
        () async {
      //= arrange
      when(client.post(any, body: anyNamed('body')))
          .thenAnswer((_) async => Response('{}', 200));
      //= act
      final Result<String> result = await sut.signIn(credential);
      //= assert
      expect(result, isA<ErrorResult>());
    });
    test('should return token string when successful', () async {
      //= arrange
      const tokenString = 'someRandomString';
      when(client.post(any, body: anyNamed('body')))
          .thenAnswer((_) async => Response(
                jsonEncode({'auth_token': tokenString}),
                200,
              ));
      //= act
      final Result<String> result = await sut.signIn(credential);
      //= assert
      expect(result.asValue.value, tokenString);
    });
  });
}
