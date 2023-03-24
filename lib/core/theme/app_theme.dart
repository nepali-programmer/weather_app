import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/constant/app_constant.dart';

@LazySingleton()
class AppThemeData {
  final ThemeData _lightThemeBase = ThemeData.from(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff345487),
      brightness: Brightness.light,
    ),
  );

  ThemeData lightTheme() {
    return _lightThemeBase.copyWith(
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: _lightThemeBase.textTheme.bodyLarge?.color,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _lightThemeBase.colorScheme.primary,
              width: 2.5,
            ),
          ),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.black,
        textColor: Colors.black,
      ),
      checkboxTheme: _lightThemeBase.checkboxTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kExtraSmallBorderRadius),
        ),
      ),
    );
  }
}
