

import 'package:bloggy/core/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppTheme{
  static _border([Color color = AppColor.whiteColor]) =>  OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color,
        width: 3,
      )
  );
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColor.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.backgroundColor
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(27),
      focusColor: _border(AppColor.gradient2),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),

        borderSide: _border(AppColor.whiteColor)
      )
    )
  );
}