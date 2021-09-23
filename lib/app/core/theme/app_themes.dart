import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO: Implement New color palette

List<Map<String, dynamic>> themes = [
  {
    'id': 1,
    'name': 'Default Light',
    'brightness': Brightness.light,
    'data': ThemeData(
      fontFamily: getFontFamilyFromLocale(),
      primaryColor: const Color(0xff0054BF),
      primaryColorLight: const Color(0xfff8f6f7),
      primaryColorDark: const Color(0xff000f4a),
      scaffoldBackgroundColor: const Color(0xfff9f9f9),
      iconTheme: IconThemeData(
        color: const Color(0xff0054BF),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w700),
        headline5: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
        headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
        bodyText2: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w700),
        button: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800),
        subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        titleTextStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w600,
            color: const Color(0xff171616).withOpacity(0.45)),
        fillColor: const Color(0xffF4F4F4),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        errorStyle: const TextStyle(
          color: Color(0xffD03333),
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardColor: Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle:
            const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
        unselectedLabelStyle:
            const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xff0054BF).withOpacity(0.35),
        selectedItemColor: const Color(0xff0054BF),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff0054BF)),
        ),
      ),
    ),
  },
  {
    'id': 2,
    'name': 'Default Dark',
    'brightness': Brightness.dark,
    'data': ThemeData(
      fontFamily: getFontFamilyFromLocale(),
      brightness: Brightness.dark,
      primaryColor: const Color(0xff0054BF),
      primaryColorLight: const Color(0xfff8f6f7),
      primaryColorDark: const Color(0xff000f4a),
      iconTheme: IconThemeData(
        color: const Color(0xfff8f6f7),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w700),
        headline5: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
        headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
        bodyText2: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w700),
        button: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800),
        subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        titleTextStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.45)),
        fillColor: Colors.grey.shade900,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        errorStyle: const TextStyle(
          color: Color(0xffD03333),
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      indicatorColor: const Color(0xff0054BF),
      cardColor: Colors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle:
            const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
        unselectedLabelStyle:
            const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xfff8f6f7).withOpacity(0.35),
        selectedItemColor: const Color(0xff0054BF),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff0054BF)),
        ),
      ),
    ),
  }
];

ThemeData getThemeById(BuildContext context, int id) {
  return themes.where((element) => element['id'] == id).first['data']
      as ThemeData;
  // switch (id) {
  //   case 1:
  //   case 2:

  //     return themes.where((element) => element['id']==1).first['data'];
  //   default:
  //     return themes['defaultTheme']!;
  // }
}

String getFontFamilyFromLocale() {
  final Locale _locale = Get.locale ?? const Locale('en', 'US');
  final String _languageCode = _locale.languageCode;
  switch (_languageCode) {
    case 'bn':
      return 'HindSiliguri';
    default:
      return 'Nunito';
  }
}
