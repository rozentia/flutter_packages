import 'package:async/async.dart';

import '../../models/token.m.dart';

abstract class AuthInterface {
  Future<Result<Token>> signIn();
  Future<void> signOut();
}
