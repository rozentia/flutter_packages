import 'package:async/async.dart';
import 'package:flutter/foundation.dart';

import '../models/credential.m.dart';
import '../models/token.m.dart';
import '../services/auth_service/auth.i.dart';
import '../services/auth_service/auth_api.i.dart';
import '../services/sign_up/sign_up.i.dart';

class EmailAuth implements AuthInterface, SignUpInterface {
  final AuthAPIInterface _api;
  Credential _credential;

  EmailAuth(this._api);

  void credential({
    @required String email,
    @required String password,
  }) =>
      _credential = Credential(
        type: AuthType.email,
        email: email,
        password: password,
      );

  @override
  Future<Result<Token>> signIn() async {
    assert(_credential != null);
    final result = await _api.signIn(_credential);
    return result.isError
        ? result.asError
        : Result.value(Token(result.asValue.value));
  }

  @override
  Future<void> signOut() async {
    // TODO Implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Result<Token>> signUp(
    String name,
    String email,
    String password,
  ) async {
    final credential = Credential(
      type: AuthType.email,
      email: email,
      name: name,
      password: password,
    );

    final result = await _api.signUp(credential);
    return result.isError
        ? result.asError
        : Result.value(Token(result.asValue.value));
  }
}
