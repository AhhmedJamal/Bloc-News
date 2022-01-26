import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/shared/style/colors.dart';

class Themes {
  static final darkMode = ThemeData.dark().copyWith(
    backgroundColor: kBlackBackGround,
    primaryColor: kRed,
    iconTheme: const IconThemeData(color: kWhite),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: kWhite),
      color: kBlackBackGround,
      systemOverlayStyle: SystemUiOverlayStyle(),
    ),
    scaffoldBackgroundColor: kBlackBackGround,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kBlackBackGround,
      unselectedItemColor: kWhite,
    ),
  );
  static final lightMode = ThemeData.light().copyWith(
    primaryColor: kRed,
    iconTheme: const IconThemeData(color: kBlack),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: kBlack),
      color: kWhite,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    scaffoldBackgroundColor: kWhite,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kWhite,
      unselectedItemColor: kBlack,
    ),
  );
}
