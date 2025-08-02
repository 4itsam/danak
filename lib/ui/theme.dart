import 'package:danak/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

Color primaryColor = const Color(0xffE91E62);
Color scaffoldBackground = const Color(0xffF2F2F2);
Color textBlackTitle = const Color(0xff212121);
Color subTextBlackTitle = const Color(0xff434343);
Color cardBackground = const Color(0xffffffff);
Color borderColor = const Color(0xffffffff);
Color shadowColor = const Color.fromARGB(87, 88, 88, 88);
Color textWhiteTitle = const Color(0xffffffff);
Color textWhiteSubTitle = const Color.fromARGB(255, 226, 226, 226);
Color textFeildBackgroundColor = const Color.fromARGB(255, 240, 240, 240);
Color hintTextColor = const Color.fromARGB(255, 129, 129, 129);

final BoxDecoration bannerDecoration = BoxDecoration(
  border: Border.all(color: borderColor, width: 5, style: BorderStyle.solid),
  boxShadow: [
    BoxShadow(
      color: shadowColor,
      offset: const Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0.7,
    ),
  ],
  borderRadius: BorderRadius.circular(20),
);

final TextStyle bannerTextStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: textWhiteTitle,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

final TextStyle bannersubTextStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: textWhiteSubTitle,
  fontSize: 12,
  fontWeight: FontWeight.w600,
);

final TextStyle bannerAuthorStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  fontSize: 10,
  color: primaryColor,
  fontWeight: FontWeight.w600,
);

final TextStyle rowSectionTitle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: textBlackTitle,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

final BoxDecoration rowBoxDecoration = BoxDecoration(
  color: cardBackground,
  border: Border.all(color: primaryColor, width: 2.3, style: BorderStyle.solid),
  boxShadow: [
    BoxShadow(
      color: shadowColor,
      offset: const Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 0,
    ),
  ],
  borderRadius: BorderRadius.circular(20),
);

final BoxDecoration decorationBoxStyle = BoxDecoration(
  border: Border(
    bottom: BorderSide(color: borderColor, width: 4, style: BorderStyle.solid),
  ),
  color: primaryColor,
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(134, 233, 30, 98),
      offset: Offset(0, 4),
      blurRadius: 10,
      spreadRadius: 0.7,
    ),
  ],
  borderRadius: BorderRadius.circular(20),
);

final TextStyle theoryBannerStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: textWhiteTitle,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

final TextStyle theoryBannerSubStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  fontSize: 14,
  color: primaryColor,
  fontWeight: FontWeight.w600,
);

final TextStyle containerHeadStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: cardBackground,
  fontSize: 18,
  fontWeight: FontWeight.w800,
);

final TextStyle bodyTextStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: textBlackTitle,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);
final TextStyle lifestyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: textWhiteTitle,
  fontSize: 20,
  fontWeight: FontWeight.w700,
);
final TextStyle lifeSubStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: textWhiteSubTitle,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

final TextStyle menuTitle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: textWhiteTitle,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

final BoxDecoration textMenuButtonStyle = BoxDecoration(
  color: primaryColor,
  borderRadius: BorderRadius.circular(20),
);

final BoxDecoration bottonSheetStyle = const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
);

final TextStyle devTextStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: textWhiteTitle,
  fontSize: 20,
  fontWeight: FontWeight.w800,
);

final TextStyle devSubTextStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: textWhiteSubTitle,
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

final BoxDecoration tipBoxStyle = BoxDecoration(
  color: primaryColor,
  borderRadius: BorderRadius.circular(20),
);

final TextStyle splashTips = TextStyle(
  fontFamily: FontFamily.iranYekan,
  fontSize: 12,
  color: textWhiteSubTitle,
  fontWeight: FontWeight.w900,
);

final TextStyle appBarLoginTextStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  fontSize: 26,
  color: primaryColor,
  fontWeight: FontWeight.w700,
);

final TextStyle hintTextStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: hintTextColor,
  fontSize: 12,
);

final TextStyle textFeildText = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: subTextBlackTitle,
  fontSize: 14,
);

final TextStyle termsNormalStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  fontSize: 12,
  color: textBlackTitle,
  fontWeight: FontWeight.w500,
);
final TextStyle termsBoldStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  fontSize: 12,
  color: primaryColor,
  fontWeight: FontWeight.w500,
);

final TextStyle loginBottonActionStyle = TextStyle(
  fontFamily: FontFamily.iranYekan,
  color: textWhiteTitle,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);
