import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final lightTheme = ThemeData(
    iconTheme: IconThemeData(color: HexaColor.fromHexa("#828282"), size: 15.w),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xffFFFFFF),
        selectedItemColor: HexaColor.fromHexa('#1C28CB'),
        selectedLabelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: HexaColor.fromHexa('#1C28CB')),
        unselectedLabelStyle: TextStyle(
          fontSize: 14.sp,
          color: HexaColor.fromHexa('#828282'),
          fontWeight: FontWeight.w500,
        ),
        unselectedItemColor: const Color(0xffBDBDBD)),
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          color: Colors.white,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 18.w),
        backgroundColor: HexaColor.fromHexa('#1C28CB'),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: Color(0xff1C28CB))),
    primaryColor: HexaColor.fromHexa('#1C28CB'),
    secondaryHeaderColor: HexaColor.fromHexa('#00A19B'),
    textTheme: TextTheme(
        subtitle2: TextStyle(
          fontSize: 14.sp,
          color: HexaColor.fromHexa('#333333'),
        ),
        subtitle1: TextStyle(
            fontSize: 18.sp,
            color: HexaColor.fromHexa('#333333'),
            fontWeight: FontWeight.w400),
        headline2: TextStyle(
          fontSize: 24.sp,
          color: HexaColor.fromHexa('#333333'),
        ),
        bodyText2: TextStyle(
          fontSize: 16.sp,
          color: HexaColor.fromHexa('#333333'),
        )),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            textStyle: TextStyle(
              fontFamily: 'DinNext',
              fontSize: 18.sp,
              color: const Color(0xffffffff),
            ),
            primary: HexaColor.fromHexa('#1C28CB'),
            fixedSize: Size(double.infinity, 44.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      textStyle: TextStyle(
        fontFamily: 'DinNext',
        fontSize: 16.sp,
        color: HexaColor.fromHexa('#1C28CB'),
      ),
      fixedSize: Size(double.infinity, 30.h),
    )));

extension HexaColor on Color {
  static Color fromHexa(String hexa) {
    hexa = hexa.replaceAll('#', '');
    if (hexa.length == 6) {
      hexa = "FF" + hexa;
    }
    return Color(int.parse(hexa, radix: 16));
  }
}
