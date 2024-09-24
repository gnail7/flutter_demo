// 定义一个自定义的主题
import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.blue, fontSize: 20),  // Changed from headline6 to titleLarge
    bodyMedium: TextStyle(color: Colors.black),               // Changed from bodyText2 to bodyMedium
  ),
);
