import 'package:flutter/material.dart';
import 'package:iddqd/variables/global_varibles.dart';

abstract class ThemeColors {
  static Color background =
      isDark ? const Color(0xFF222222) : const Color(0xFFFFFFFF);
  static Color text =
      isDark ? const Color(0xFFffffff) : const Color(0xFF000000);
  static Color dotsBloc = isDark
      ? const Color(0xFF9C9C9C).withOpacity(0.4)
      : const Color(0xFFBFBFBF).withOpacity(0.4);
  static Color settingsText =
      isDark ? const Color(0xFFCDCDCD) : const Color(0xFF000000);
  static Color calendarButtons =
      isDark ? const Color(0xFF222222) : const Color(0xffE4E4E4);
  static Color calendarDivider =
      isDark ? const Color(0xFF525252) : const Color(0xffE5E5E5);
  static Color calendarView =
      isDark ? const Color(0xFF262B34) : const Color(0xffF1F8F3);
  static Color textInput =
      isDark ? const Color(0xFF262B34) : const Color(0xffECECED);
}

abstract class MyColors {
  static const mainOrange = Color(0xFFC57600);
  static const mainPurple = Color(0xFFC100C5);
  static const mainRed = Color(0xFFFD3137);
  static const mainRedDark = Color(0xFFC50000);

  static const lightText = Color(0xFFffffff);
  static const darkText = Color(0xFF000000);
  static const greyText = Color(0xFFEFEFEF);

  static const background = Color(0xFFFFFFFF);
  static const lightBackground = Color(0xFFffffff);
  static const backSubscription = Color(0xFF9ce4ff);
  static const bottomBarColor = Color(0xFF1F1F1F);
  static const topBarColor = Color(0xFF2B2E43);
  static const greyLine = Color(0xFFEFEFEF);
  static const darkLine = Color(0xFF26272C);

  static const gradient0 = Color(0xFFE39FE4);
  static const gradient1 = Color(0xFFE39CE1);
  static const gradient2 = Color(0xFFDB89DC);

  static const paginationColor = Color(0xFF2B2E43);
  static const paginationColorActive = Color(0xFFFFFFFF);

  static const selectedItemColor = Color(0xff007AFF);
  static const unselectedItemColor = Color(0xff999999);

  static const user0 = Color(0xFF84EC45);
  static const user1 = Color(0xFFCD62D8);
  static const user2 = Color(0xFFD89462);
  static const user3 = Color(0xFF62D8D1);
}
