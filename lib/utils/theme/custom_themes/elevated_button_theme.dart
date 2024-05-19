import 'package:flutter/material.dart';
import 'package:ticket_finder/constants/colors.dart';

class XElevatedButtonTheme {

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: XColors.blue,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: XColors.blue),
      padding:  const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      textStyle: const TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
    )
  );
}