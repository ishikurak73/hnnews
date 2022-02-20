// import 'package:flutter/material.dart';
//Color definitions
// Replace # with 0xff (FF means full opacity).
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color colorOrange = Color(0xffF47900);
const Color colorRed = Color(0xffF47900);
const Color colorGray = Color(0xffCDCED2);
const Color colorGrayLight = Color(0xffECEDF1);
const Color colorGrayLightest = Color(0xffF5F5F6);
const Color colorBlueDark = Color(0xff5463E5);
const Color colorOrangeDart = Color(0xffE37100);
const Color colorWhite = Color(0xffffffff);

// Colors brand
const Color primary1 = Color(0xff8946F7);
const Color primary2 = Color(0xffFFC830);
const Color primary3 = Color(0xff1B48F4);
const Color primary4 = Color(0xff594611);
const Color secondary1 = Color(0xff33E2B8);
const Color secondary2 = Color(0xffEA3F56);
const Color grey4 = Color(0xffC7C7C7);
const Color black1 = Color(0xff000000);
const Color white1 = Color(0xffffffff);

// Colors basic #EBEBEB
const Color red1 = Color(0xffD50000);
const Color orange1 = Color(0xffFF6D00);
const Color yellow1 = Color(0xffFFD600);
const Color yellow3 = Color(0xffFFC930);
const Color green1 = Color(0xff00C853);
const Color blue1 = Color(0xff2962FF);
const Color violet1 = Color(0xff6200EA);
const Color grey1 = Color(0xff90A4AE);
const Color grey2 = Color(0xffCFD8DC);
const Color grey3 = Color(0xffECEFF1);
const Color grey5 = Color(0xffF6F6F6);
const Color grey6 = Color(0xffEBEBEB);
const Color grey7 = Color(0xffD1D1D1);
const Color grey10 = Color(0xfff8f8f8);
const Color black2 = Color(0xff212121);
const Color black3 = Color(0xff808080);
const Color black4 = Color(0xff434343);
const Color black5 = Color(0xff303030);
const Color contentBlack = Color(0xff292929);
const Color red2 = Color(0xffFFCDD2);
const Color orange2 = Color(0xffFFE0B2);
const Color yellow2 = Color(0xffFFF9C4);
const Color green2 = Color(0xffC8E6C9);
const Color blue2 = Color(0xffB3E5FC);
const Color violet2 = Color(0xffD1C4E9);
const Color grey8 = Color(0xffB9B9B0);
const Color grey9 = Color(0xff4E4E4E);
// Colors for Reactions
const Color reactionRed = Color(0xffd10a03);
const Color reactionYellow = Color(0xffffd62b);

//Space definitions
const double space0 = 0;
const double space1 = 1;
const double space4 = 4;
const double space6 = 6;
const double space8 = 8;
const double space10 = 10;
const double space12 = 12;
const double space15 = 15;
const double space16 = 16;
const double space18 = 18;
const double space20 = 20;
const double space24 = 24;
const double space32 = 32;
const double space40 = 40;
const double space48 = 48;

//FontSize definitions
const double fontScalingFactor = .65;
const double fontScalingFactorHeader = .75;
const double fontScalingFactorContent = .8;
const double fontScalingFactorButtons = .85;
const double fontSizeDot = 24;
const double fontSize12 = 12;
const double fontSize14 = 14;
const double fontSize16 = 16;
const double fontSize18 = 18;
const double fontSize20 = 20;
const double fontSize21 = 21;
const double fontSize22 = 22;
const double fontSize23 = 23;
const double fontSize24 = 24;
const double fontSize26 = 26;
const double fontSize28 = 28;
const double fontSize30 = 30;
const double fontSize32 = 32;
const double fontSize36 = 36;
const double fontSize42 = 42;
const double fontSize48 = 48;
const double fontSize64 = 64;

// Fonts
const String iBMPlexSans = "IBMPlexSans";
const String iBMPlexSerif = "IBMPlexSerif";
const String BITTER_FONT = "Bitter";
const String ROBOTO_FONT = "Roboto";

// FontWeight
const FontWeight lightFontWeight = FontWeight.w300;
const FontWeight regularFontWeight = FontWeight.w400;
const FontWeight mediumFontWeight = FontWeight.w500;
const FontWeight semiBoldFontWeight = FontWeight.w600;
const FontWeight boldFontWeight = FontWeight.w700;

// LineHeight
const double lineHeightNone = 1;
const double lineHeight120 = 1.2;
const double lineHeight140 = 1.4;
const double lineHeightNormal = 1.5;
const double lineHeightLoose = 1.75;
const double lineHeightExtraLoose = 2.5;

// Borders
Border border0 = Border.all(width: 0.0);
Border border1 = Border.all(width: 1.0);

// Borders
BorderRadius borderRadius0 = BorderRadius.circular(0);
BorderRadius borderRadius1 = BorderRadius.circular(4);
BorderRadius borderRadius2 = BorderRadius.circular(8);
BorderRadius borderRadius6 = BorderRadius.circular(24);

// Image height and width
const double avatarSize1 = 24;
const double articleImageHeight = 250;
const double footerAndHeaderHeight = 200;

//---------------Text Styles-----------------//
TextStyle header1Style({Color? color = black1}) {
  return TextStyle(
    fontFamily: BITTER_FONT,
    fontWeight: boldFontWeight,
    fontSize: fontSize48 * fontScalingFactorHeader,
    color: color,
    height: lineHeight120,
  );
}

TextStyle header2Style({Color? color = black1}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: boldFontWeight,
      fontSize: fontSize42 * fontScalingFactorHeader,
      color: color,
      height: lineHeight120);
}

TextStyle appHeader3Style({Color? color = black1}) {
  return TextStyle(
      fontFamily: iBMPlexSans,
      fontWeight: boldFontWeight,
      fontSize: fontSize36 * fontScalingFactorHeader,
      color: color,
      height: lineHeight120);
}

TextStyle header3Style({Color? color = black1}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: boldFontWeight,
      fontSize: fontSize36 * fontScalingFactorHeader,
      color: color,
      height: lineHeight120);
}

TextStyle header4Style({Color color = black4}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: semiBoldFontWeight,
      fontSize: fontSize30 * fontScalingFactorHeader,
      color: color,
      height: lineHeight120);
}

TextStyle header5Style({Color color = black4, String fontFamily: ROBOTO_FONT}) {
  return TextStyle(
      fontFamily: fontFamily,
      fontWeight: boldFontWeight,
      fontSize: fontSize28 * fontScalingFactorHeader,
      color: color,
      height: lineHeightNormal);
}

TextStyle header6Style(
    {Color? color = black1, String fontFamily: ROBOTO_FONT}) {
  return TextStyle(
      fontFamily: fontFamily,
      fontWeight: semiBoldFontWeight,
      fontSize: fontSize26 * fontScalingFactorHeader,
      color: color,
      height: lineHeightNormal);
}

TextStyle header7Style({Color color = black1}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: semiBoldFontWeight,
      fontSize: fontSize30 * fontScalingFactorHeader,
      color: color,
      height: lineHeightNormal);
}

TextStyle header8Style({Color? color = black1}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: regularFontWeight,
      fontSize: fontSize30 * fontScalingFactorHeader,
      color: color,
      height: lineHeightNormal);
}

TextStyle header9Style({Color? color = black1}) {
  return TextStyle(
      fontFamily: BITTER_FONT,
      fontWeight: boldFontWeight,
      fontSize: fontSize20 * fontScalingFactorHeader,
      color: color,
      height: lineHeightNormal);
}

TextStyle buttonTextStyle({Color color = colorWhite}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: mediumFontWeight,
      fontSize: fontSize18 * fontScalingFactorButtons,
      color: color,
      height: lineHeightNormal);
}

TextStyle button2TextStyle({Color color = colorWhite}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: regularFontWeight,
      fontSize: fontSize18 * fontScalingFactorButtons,
      color: color,
      height: lineHeightNormal);
}

TextStyle categoryHeaderTextStyle({Color color = black4}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: semiBoldFontWeight,
      fontSize: fontSize22 * fontScalingFactorHeader,
      color: color,
      height: lineHeight140);
}

TextStyle content1TextStyle({Color color = contentBlack}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: regularFontWeight,
      fontSize: fontSize24 * fontScalingFactorContent,
      color: color,
      height: lineHeightNormal);
}

TextStyle content2TextStyle(
    {Color color = contentBlack,
    String fontFamily = ROBOTO_FONT,
    double fontSize: fontSize22}) {
  return TextStyle(
      fontFamily: fontFamily,
      fontWeight: regularFontWeight,
      fontSize: fontSize * fontScalingFactorContent,
      color: color,
      height: lineHeightNormal);
}

TextStyle content3TextStyle({Color color = contentBlack}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: regularFontWeight,
      fontSize: fontSize21 * fontScalingFactorContent,
      color: color,
      height: lineHeightNormal);
}

TextStyle content4TextStyle({Color color = contentBlack}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: regularFontWeight,
      fontSize: fontSize24 * fontScalingFactorContent,
      color: color,
      height: lineHeightNormal);
}

TextStyle content5TextStyle({Color color = contentBlack}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: regularFontWeight,
      fontSize: fontSize24 * fontScalingFactorContent,
      color: color,
      height: lineHeight140);
}

TextStyle content6TextStyle({Color color = contentBlack}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: regularFontWeight,
      fontSize: fontSize22 * fontScalingFactorContent,
      color: color,
      height: lineHeightNormal);
}

TextStyle captionTextStyle({Color? color = black1}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: regularFontWeight,
      fontSize: fontSize21 * fontScalingFactor,
      color: color,
      height: lineHeightNormal);
}

TextStyle caption1TextStyle({Color? color = black1}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: regularFontWeight,
      fontSize: fontSize21 * fontScalingFactorButtons,
      color: color,
      height: lineHeightNormal);
}

TextStyle labeTextStyle({Color? color = black1}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: boldFontWeight,
      fontSize: fontSize22 * fontScalingFactorContent,
      color: color,
      height: lineHeightNormal);
}

TextStyle notificationTitleTextStyle({Color color = black1}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: mediumFontWeight,
      fontSize: fontSize22 * fontScalingFactorHeader,
      color: color,
      height: lineHeightNormal);
}

TextStyle linkTextStyle({Color color = black3}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: regularFontWeight,
      fontSize: fontSize22 * fontScalingFactorContent,
      color: color,
      decoration: TextDecoration.underline,
      height: lineHeightNormal);
}

TextStyle alertDialogContentStyle({Color color = black3}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: mediumFontWeight,
      fontSize: fontSize24 * fontScalingFactorContent,
      color: color,
      height: lineHeightNormal);
}

TextStyle seperatorDotTextStyle({Color color = black3}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: regularFontWeight,
      fontSize: fontSizeDot * fontScalingFactorContent,
      color: color,
      height: lineHeightNormal);
}

TextStyle notificationBadgeTextStyle({Color color = black1}) {
  return TextStyle(
      fontFamily: ROBOTO_FONT,
      fontWeight: regularFontWeight,
      fontSize: fontSize21 * fontScalingFactorContent,
      color: color,
      height: lineHeightNone);
}

TextStyle underliedTextStyle({Color color = black1}) {
  return TextStyle(
    fontFamily: ROBOTO_FONT,
    fontWeight: regularFontWeight,
    fontSize: fontSize21 * fontScalingFactorContent,
    color: color,
    height: lineHeightNormal,
    decoration: TextDecoration.underline,
    decorationColor: white1,
    decorationStyle: TextDecorationStyle.double,
    decorationThickness: 1.3,
  );
}
