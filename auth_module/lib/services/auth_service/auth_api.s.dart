import 'dart:convert';

import 'package:async/async.dart';
import 'package:http/http.dart';

import '../../helpers/mapper.dart';
import '../../models/credential.m.dart';
import 'auth_api.i.dart';

class AuthAPIService implements AuthAPIInterface {
  final Client _client;
  String baseUrl;

  AuthAPIService(this.baseUrl, this._client);

  Future<Result<String>> _postCredential(
      String endpoint, Credential credential) async {
    final response = await _client.post(
      endpoint,
      body: Mapper.toJson(credential),
    );
    if (response.statusCode != 200) {
      return Result.error('Server error');
    }
    final json = jsonDecode(response.body);
    return json['auth_token'] != null
        ? Result.value(json['auth_token'] as String)
        : Result.error(json['message'] ?? 'Server error');
  }

  @override
  Future<Result<String>> signIn(Credential credential) async =>
      _postCredential('$baseUrl/auth/signin', credential);

  @override
  Future<Result<String>> signUp(Credential credential) async =>
      _postCredential('$baseUrl/auth/signup', credential);
}
