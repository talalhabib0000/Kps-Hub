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
    displayLarge:
        TextStyle(color: kTextColor, fontSize: 32, fontWeight: FontWeight.w700),
    displayMedium: TextStyle(
      color: kTextColor,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      color: kTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: kTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w300,
    ),
    headlineSmall:
        TextStyle(color: kTextColor, fontSize: 16, fontWeight: FontWeight.w700),
    titleLarge: TextStyle(
      color: kTextColor,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    bodyLarge: TextStyle(
      color: kTextColor,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
      color: kTextColor,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  );
}
