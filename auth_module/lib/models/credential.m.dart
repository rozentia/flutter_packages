import 'package:flutter/foundation.dart';

class Credential {
  final String name;
  final String email;
  final String password;
  final AuthType type;

  Credential({
    @required this.type,
    this.name,
    @required this.email,
    this.password,
  });
}

enum AuthType { email, google, apple }
