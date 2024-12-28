import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:flutter/material.dart';

// Explanation:
// FontWeight.bold: Equivalent to FontWeight.w700.
// FontWeight.w600: Semi-bold weight.
// Other options include:
// FontWeight.w400: Normal weight (regular).
// FontWeight.w500: Medium weight.

class AppStyle {
  static const TextStyle comfortaaBold26Black = TextStyle(
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.bold,
    fontSize: 26.0,
    color: kBlackColor,
  );

  static const TextStyle nunitoBold11White = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.bold,
    fontSize: 11.0,
    color: kWhiteColor,
  );

  static const TextStyle nunitoBold15Black = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
    color: kBlackColor,
  );
  static const TextStyle nunitoBold15DarkGray = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
    color: kDarkGrayColor,
  );
  static const TextStyle nunitoBold15Blue = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
    color: kBlueColor,
  );
  static const TextStyle nunitoRegular15Black = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w400,
    fontSize: 15.0,
    color: kBlackColor,
  );
}