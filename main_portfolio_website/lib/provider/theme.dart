import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_portfolio_website/utils/constants.dart';

final themeProvider = ChangeNotifierProvider(((ref) => CustomThemeProvider()));

class CustomThemeProvider extends ChangeNotifier {
  ThemeData themeData = MyThemes.lightTheme;

  bool get isDarkMode => themeData == MyThemes.darkTheme;

  ThemeData get getCurrentTheme => isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme;

  void changeTheme(bool? val) {
    if (val != null) {
      themeData = val ? MyThemes.darkTheme : MyThemes.lightTheme;
    }
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightPrimaryColor,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: const Color(0xFFFFD800),
    iconTheme: const IconThemeData(color: darkPrimaryColor),
    primarySwatch: Colors.yellow,
    textButtonTheme:
        TextButtonThemeData(style: ButtonStyle(foregroundColor: MaterialStateProperty.all(kBackgroundColor))),
  );
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(7, 17, 26, 1),
      colorScheme: const ColorScheme.dark(),
      primarySwatch: Colors.yellow,
      primaryColor: const Color(0xFFFFD800),
      iconTheme: IconThemeData(color: Colors.grey[400]),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
      )));
}
