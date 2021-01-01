import 'package:async/async.dart';
import 'package:auth_module/models/credential.m.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/token.m.dart';
import '../services/auth_service/auth.i.dart';
import '../services/auth_service/auth_api.i.dart';

class GoogleAuth implements AuthInterface {
  final AuthAPIInterface _authApi;
  final GoogleSignIn _googleSignIn;
  GoogleSignInAccount _currentUser;

  GoogleAuth(this._authApi, [GoogleSignIn googleSignIn])
      : _googleSignIn = googleSignIn ??
            GoogleSignIn(scopes: [
              'email',
              'profile',
            ]);

  @override
  Future<Result<Token>> signIn() async {
    await _handleGoogleSignIn();
    if (_currentUser == null) {
      return Result.error('Failed to sign in with Google');
    }
    final credential = Credential(
      type: AuthType.google,
      email: _currentUser.email,
      name: _currentUser.displayName,
    );
    final result = await _authApi.signIn(credential);
    return result.isError
        ? result.asError
        : Result.value(Token(result.asValue.value));
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      _currentUser = await _googleSignIn.signIn();
    } catch (e) {
      return;
    }
  }

  @override
  Future<void> signOut() => _googleSignIn.disconnect();
}
