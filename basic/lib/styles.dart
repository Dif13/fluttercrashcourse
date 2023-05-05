import 'package:flutter/material.dart';

class Styles {
  static const _textSizeLarge = 25.0;
  static const _textSizeDefault = 16.0;
  static const Color _textColorStrong = Colors.black;
  static const Color _textColorDefault = Colors.grey;
  static const String _fontNameDefault = 'Muli';

  static const naviBarTitle = TextStyle(
    fontFamily: _fontNameDefault,
  );
  static const headerLarge = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeLarge,
    color: _textColorStrong,
  );

  static const textDefault = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    color: _textColorDefault,
  );
}
