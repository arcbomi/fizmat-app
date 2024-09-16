import 'package:flutter/material.dart';

class FizTheme {
  final Color _navyBlue = const Color(0xFF111C25); // 深蓝色
  final Color _lightNavyBlue = const Color(0xFF1D2031); // 较浅的深蓝色
  final Color _vibrantGreen = const Color(0xFF4CB050); //活力绿
  final Color _darkCharcoal = const Color(0xFF302E2D);

  Color get getVibrantGreen => _vibrantGreen;
  Color get getDarkCharcoal => _darkCharcoal;
  Color get getLightNavyBlue => _lightNavyBlue;

  ThemeData buildTheme() {
    return ThemeData(
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: _navyBlue,
      primaryColor: Colors.white,
      colorScheme: const ColorScheme.dark(
        primary: Colors.white, // 主要颜色，用于文本颜色
        secondary: Colors.black, // 次级颜色，用于次级文本颜色
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _lightNavyBlue, // AppBar 背景颜色
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.white, // 按钮背景颜色
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _navyBlue, // 底部导航栏背景颜色
        selectedItemColor: Colors.white, // 选中项的颜色
        unselectedItemColor: Colors.black, // 未选中项的颜色
      ),
    );
  }


}
