import 'package:flutter/material.dart';

TextStyle h1({Color? textColor}) => TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: textColor ?? Colors.black);

TextStyle h2({Color? textColor}) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: textColor ?? Colors.black);

TextStyle h3({Color? textColor}) => TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    color: textColor ?? Colors.black);
