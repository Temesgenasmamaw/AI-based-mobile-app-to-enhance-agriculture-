import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? Color(0xFF04010E) : Color(0xFFB1AEAE),
      primaryColor: isDarkTheme ? Colors.black : Colors.grey.shade300,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      hintColor: isDarkTheme ? Color(0xFFE0E0E0) : Colors.grey.shade800,
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xD203033A) : Colors.white,
      iconTheme: isDarkTheme
          ? IconThemeData(color: Color(0xFF7C767E))
          : IconThemeData(color: Colors.purple),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      bottomNavigationBarTheme: isDarkTheme
          ? BottomNavigationBarThemeData(backgroundColor: Color(0xD203033A))
          : BottomNavigationBarThemeData(
              backgroundColor: Color(0xFF390242),
              selectedItemColor: Color(0xFF0FDFDF),
              unselectedItemColor: Colors.white,
            ),
      elevatedButtonTheme: isDarkTheme
          ? ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.amberAccent,
                elevation: 5,
                backgroundColor: Color(0xD203033A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          : ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                shadowColor: Color.fromRGBO(248, 229, 229, 0.122),
                elevation: 40,
                tapTargetSize: MaterialTapTargetSize.padded,
                textStyle: TextStyle(color: Colors.black, fontSize: 18),
                backgroundColor: Color(0xFF948A8A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
      drawerTheme: isDarkTheme
          ? DrawerThemeData(
              elevation: 5,
              backgroundColor: Color(0xD203033A),
            )
          : DrawerThemeData(
              elevation: 20.0,
              backgroundColor: Color(0xFFEFEAF0),
            ),
      appBarTheme: isDarkTheme
          ? AppBarTheme(
              elevation: 5,
              shadowColor: Colors.amberAccent,
              backgroundColor: Color(0xD203033A),
            )
          : AppBarTheme(
              elevation: 20.0,
              backgroundColor: Color(0xFF390242),
              shadowColor: Colors.grey[800],
            ),
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDarkTheme ? Colors.white : Colors.black),
    );
  }
}
