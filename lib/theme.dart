import 'package:flutter/material.dart';

final TextTheme textTheme = TextTheme(
  headline4: TextStyle(
    color: colorScheme['text1'],
    fontWeight: FontWeight.bold,
    fontSize: 32,
    height: 1.2,
  ),
  headline5: TextStyle(
    color: colorScheme['text1'],
    fontWeight: FontWeight.bold,
    fontSize: 24,
    height: 1.2,
  ),
  headline6: TextStyle(
    color: colorScheme['text1'],
    fontSize: 20,
    fontWeight: FontWeight.bold,
    height: 1.2,
  ),
  subtitle1: TextStyle(
    color: colorScheme['text1'],
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.2,
  ),
  subtitle2: TextStyle(
    color: colorScheme['text1'],
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 1.2,
  ),
  bodyText1: TextStyle(
    color: colorScheme['text1'],
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.2,
  ),
  bodyText2: TextStyle(
    color: colorScheme['text1'],
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.2,
  ),
  button: TextStyle(
    color: colorScheme['text1'],
    fontWeight: FontWeight.bold,
    height: 1.2,
  ),
);

const Map<String, Color> colorScheme = {
  'primary': Color(0xFF3456DD), 
  'accent1': Color(0xFF4BD6F3), 
  'accent2': Color(0xFFF3EC00),
  'background1': Color(0xFFF4F4F4), 
  'background2': Color(0xFFEAF2F9), 
  'background3': Color(0xFFBCE0FD),
  'text1': Color(0xFF464646), 
  'text2': Color(0xFF929292), 
};