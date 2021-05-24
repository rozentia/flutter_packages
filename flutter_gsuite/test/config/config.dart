import 'package:flutter_gsuite/src/constants/constants.dart';

import 'package:http/http.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'secrets.dart';

/// Regular Test User 1
Future<AutoRefreshingAuthClient> regularTestClient1() async => _resolveClient(
      kOAuthAccessTokenRegularUser1,
      kOAuthRefreshTokenRegularUser1,
      kOAuthAccessTokenExpiryRegularUser1,
    );

/// Regular Test User 2
Future<AutoRefreshingAuthClient> regularTestClient2() async => _resolveClient(
      kOAuthAccessTokenRegularUser2,
      kOAuthRefreshTokenRegularUser2,
      kOAuthAccessTokenExpiryRegularUser2,
    );

/// Gsuite Test User 1
Future<AutoRefreshingAuthClient> gesuiteTestClient1() async => _resolveClient(
      kOAuthAccessTokenGsuiteUser1,
      kOAuthRefreshTokenGsuiteUser1,
      kOAuthAccessTokenExpiryGsuiteUser1,
    );

//= Base getters
/// Auto refreshing auth client for user
// AutoRefreshingAuthClient _getRefreshableClient(String accessToken, String refreshToken, DateTime expiry) {
//   final credentials = _getAppBaseCredentials(accessToken, refreshToken, expiry);
//   return autoRefreshingClient(flutterTestClient, credentials, authenticatedClient(Client(), credentials));
// }

/// Base credentials for Lucu App
AccessCredentials _getAppBaseCredentials(String accessToken, String refreshToken, DateTime expiry) =>
    AccessCredentials(AccessToken('Bearer', accessToken, expiry), refreshToken, SCOPES);

Future<AutoRefreshingAuthClient> _resolveClient(String accessToken, String refreshToken, DateTime expiry) async =>
    autoRefreshingClient(
      flutterTestClient,
      await refreshCredentials(flutterTestClient, _getAppBaseCredentials(accessToken, refreshToken, expiry), Client()),
      Client(),
    );
