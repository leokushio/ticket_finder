

import 'package:flutter/material.dart';
import 'package:ticket_finder/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ticket_finder/utils/theme/custom_themes/text_theme.dart';

class XAppTheme {

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'SFProDisplay',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Color(0xff0c0c0c),
    textTheme: XTextTheme.darkTextTheme,
    elevatedButtonTheme: XElevatedButtonTheme.elevatedButtonTheme

  );
}