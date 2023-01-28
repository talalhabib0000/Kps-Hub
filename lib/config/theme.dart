import 'package:flutter/material.dart';
import '../constants/constants.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: kBackgroundColor,
      appBarTheme: const AppBarTheme(
          color: kBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: kTextColor)),
      fontFamily: 'Sans',
      textTheme: textTheme());
}

TextTheme textTheme() {
  return const TextTheme(
    headline1:
        TextStyle(color: kTextColor, fontSize: 32, fontWeight: FontWeight.w700),
    headline2: TextStyle(
      color: kTextColor,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    headline3: TextStyle(
      color: kTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    headline4: TextStyle(
      color: kTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w300,
    ),
    headline5:
        TextStyle(color: kTextColor, fontSize: 16, fontWeight: FontWeight.w700),
    headline6: TextStyle(
      color: kTextColor,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    bodyText1: TextStyle(
      color: kTextColor,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    bodyText2: TextStyle(
      color: kTextColor,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  );
}
