import 'package:async/async.dart';

import '../../models/credential.m.dart';

abstract class AuthAPIInterface {
  Future<Result<String>> signIn(Credential credential);
  Future<Result<String>> signUp(Credential credential);
}
