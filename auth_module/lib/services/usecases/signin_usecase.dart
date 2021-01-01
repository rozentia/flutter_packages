import 'package:async/async.dart';

import '../../models/token.m.dart';
import '../auth_service/auth.i.dart';

class SignInUseCase {
  final AuthInterface _authService;

  SignInUseCase(this._authService);

  Future<Result<Token>> execute() async {
    return await _authService.signIn();
  }
}
