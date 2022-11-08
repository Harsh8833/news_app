import 'package:flutter/material.dart';

const redColor = Color(0xffC62729);
const blueColor = Color(0xff023891);
const primaryColor = Color(0xFFFFFFFF);
const blackColor = Color(0xFF000000);
const transparent = Colors.transparent;
var darkGreyColor = Colors.grey.shade800;
const greyColor = Colors.grey;
var lightGreyColor = Colors.grey.shade100;
const offWhiteColor = Color(0xffF8F8FB);
const greenColor = Color(0xff61D878);

TextStyle hintTextStyle = TextStyle(
  color: darkGreyColor,
  fontSize: 15.0,
);
TextStyle labelTextStyle = TextStyle(
  color: darkGreyColor,
  fontWeight: FontWeight.bold,
  fontSize: 15.0,
);

TextStyle descriptionTS = TextStyle(fontSize: 16, color: darkGreyColor);

TextStyle smallDescriptionTS = TextStyle(fontSize: 15, color: darkGreyColor);

TextStyle headingTS = const TextStyle(
    fontSize: 17, color: blackColor, fontWeight: FontWeight.bold);

TextStyle smallHeadingTS = const TextStyle(
    fontSize: 14, color: blackColor, fontWeight: FontWeight.bold);

TextStyle primaryHeadingTS = const TextStyle(
    fontSize: 17, color: primaryColor, fontWeight: FontWeight.bold);

TextStyle smallAuthorNameTS = const TextStyle(fontSize: 14, color: greyColor);

TextStyle authorNameTS = const TextStyle(fontSize: 16, color: greyColor);

TextStyle primarySmallAuthorNameTS =
    const TextStyle(fontSize: 14, color: primaryColor);

TextStyle primaryAuthorNameTS =
    const TextStyle(fontSize: 16, color: primaryColor);

BoxDecoration boxDecoration = BoxDecoration(
  color: primaryColor,
  boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(0.8),
        blurRadius: 20,
        offset: const Offset(-0.1, 1)),
  ],
);

BoxDecoration fieldDecoration = BoxDecoration(
  color: lightGreyColor,
  borderRadius: BorderRadius.circular(4),
);
