library sfpro_iconset;

import 'package:flutter/widgets.dart';

class SFProIconData extends IconData {
  const SFProIconData(int codePoint)
      : super(
          codePoint,
          fontFamily: 'SFProIconSet',
          fontPackage: 'sfpro_iconset',
        );
}
