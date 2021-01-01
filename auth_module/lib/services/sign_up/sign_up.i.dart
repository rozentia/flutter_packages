import 'package:async/async.dart';

import '../../models/token.m.dart';

abstract class SignUpInterface {
  Future<Result<Token>> signUp(
    String name,
    String email,
    String password,
  );
}
