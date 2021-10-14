import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

List<Map<String, dynamic>> themes = [
  {
    'id': 1,
    'name': 'Default Light',
    'brightness': Brightness.light,
    'data': ThemeData.light().copyWith(
      primaryColor: const Color(0xffFF4F5B),
      secondaryHeaderColor: const Color(0xff30475E),
      primaryColorLight: const Color(0xffF4999F),
      primaryColorDark: const Color(0xffF05454),
      colorScheme: ColorScheme.light().copyWith(
        primary: Color(0xffFF4F5B),
      ),
      scaffoldBackgroundColor: const Color(0xfff9f9f9),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        headline2: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700),
        headline3: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
        headline4: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
        headline5: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        headline6: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
        bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
        bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
        button: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800),
        subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ).apply(
        bodyColor: Color(0xff30475E),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xffF4999F)),
        ),
      ),
    ),
  },
];

ThemeData getThemeById(BuildContext context, int id) {
  return themes.where((element) => element['id'] == id).first['data'] as ThemeData;
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



//import 'package:flutter/material.dart';

// class MyTheme {
//   static final lightTheme = ThemeData(
//     primaryColor: const Color(0xffFF4F5B),
//     primaryColorLight: const Color(0xffF4999F),
//     primaryColorDark: const Color(0xffF05454),
//     colorScheme: ColorScheme.light(),
//     scaffoldBackgroundColor: const Color(0xfff9f9f9),
//     primarySwatch: MaterialColor(0xffFF4F5B, const {
//       //will implement swatch
//       50: const Color(0xffFF4F5B),
//       100: const Color(0xffFF4F5B),
//       200: const Color(0xffFF4F5B),
//       300: const Color(0xffFF4F5B),
//       400: const Color(0xffFF4F5B),
//       500: const Color(0xffFF4F5B),
//       600: const Color(0xffFF4F5B),
//       700: const Color(0xffFF4F5B),
//       800: const Color(0xffFF4F5B),
//       900: const Color(0xffFF4F5B)
//     }),
//     iconTheme: IconThemeData(
//       color: const Color(0xff0054BF),
//     ),
//     textTheme: const TextTheme(
//       headline1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
//       bodyText1: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w400),
//       bodyText2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
//       caption: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w400),
//       button: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800),
//       subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
//     ),
//     appBarTheme: const AppBarTheme(
//       centerTitle: true,
//       backgroundColor: Colors.transparent,
//       shadowColor: Colors.transparent,
//       titleTextStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(100.0),
//         borderSide: BorderSide.none,
//       ),
//       hintStyle: TextStyle(
//           fontSize: 13.0, fontWeight: FontWeight.w600, color: const Color(0xff171616).withOpacity(0.45)),
//       fillColor: const Color(0xffF4F4F4),
//       filled: true,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//       errorStyle: const TextStyle(
//         color: Color(0xffD03333),
//         fontSize: 12.0,
//         fontWeight: FontWeight.w600,
//       ),
//     ),
//     cardColor: Colors.white,
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       selectedLabelStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
//       unselectedLabelStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
//       type: BottomNavigationBarType.fixed,
//       unselectedItemColor: const Color(0xff0054BF).withOpacity(0.35),
//       selectedItemColor: const Color(0xff0054BF),
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(Color(0xffFF4F5B)),
//       ),
//     ),
//   );

//   static final darkTheme = ThemeData(
//     primaryColor: const Color(0xffFF4F5B),
//     primaryColorLight: const Color(0xffF4999F),
//     primaryColorDark: const Color(0xffF05454),
//     colorScheme: ColorScheme.dark(),
//     scaffoldBackgroundColor: const Color(0xfff9f9f9),
//     primarySwatch: MaterialColor(0xffFF4F5B, const {
//       //will implement swatch
//       50: const Color(0xffFF4F5B),
//       100: const Color(0xffFF4F5B),
//       200: const Color(0xffFF4F5B),
//       300: const Color(0xffFF4F5B),
//       400: const Color(0xffFF4F5B),
//       500: const Color(0xffFF4F5B),
//       600: const Color(0xffFF4F5B),
//       700: const Color(0xffFF4F5B),
//       800: const Color(0xffFF4F5B),
//       900: const Color(0xffFF4F5B)
//     }),
//     iconTheme: IconThemeData(
//       color: const Color(0xff0054BF),
//     ),
//     textTheme: const TextTheme(
//       headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
//       headline5: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
//       headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
//       bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
//       bodyText2: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w700),
//       button: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800),
//       subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
//     ),
//     appBarTheme: const AppBarTheme(
//       centerTitle: true,
//       backgroundColor: Colors.transparent,
//       shadowColor: Colors.transparent,
//       titleTextStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(100.0),
//         borderSide: BorderSide.none,
//       ),
//       hintStyle: TextStyle(
//           fontSize: 13.0, fontWeight: FontWeight.w600, color: const Color(0xff171616).withOpacity(0.45)),
//       fillColor: const Color(0xffF4F4F4),
//       filled: true,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//       errorStyle: const TextStyle(
//         color: Color(0xffD03333),
//         fontSize: 12.0,
//         fontWeight: FontWeight.w600,
//       ),
//     ),
//     cardColor: Colors.white,
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       selectedLabelStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
//       unselectedLabelStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
//       type: BottomNavigationBarType.fixed,
//       unselectedItemColor: const Color(0xff0054BF).withOpacity(0.35),
//       selectedItemColor: const Color(0xff0054BF),
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(Color(0xffFF4F5B)),
//       ),
//     ),
//   );
// }
