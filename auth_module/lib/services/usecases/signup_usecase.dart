import 'package:async/async.dart';

import '../../models/token.m.dart';
import '../sign_up/sign_up.i.dart';

class SignUpUseCase {
  final SignUpInterface _signUpService;

  SignUpUseCase(this._signUpService);

  Future<Result<Token>> execute(
    String name,
    String email,
    String password,
  ) async {
    return await _signUpService.signUp(
      name,
      email,
      password,
    );
  }
}
