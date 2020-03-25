import 'package:flutter/material.dart';
import 'package:pylot/models/theme/theme.dart';

///////////////////////////////////////////////////////////////////////////
// Fonts
///////////////////////////////////////////////////////////////////////////
final String _fontFamily = 'Oxanium';
///////////////////////////////////////////////////////////////////////////
// Colors
///////////////////////////////////////////////////////////////////////////
Color _primaryColor;
Color _primaryColorLight;
Color _primaryColorDark;
Color _accentColor;
Color _scaffoldBackgroundColor;
Color _barColor;
Color _splashColor;
///////////////////////////////////////////////////////////////////////////
// Themes
///////////////////////////////////////////////////////////////////////////
AppBarTheme _appBarTheme;
ButtonThemeData _buttonTheme;
CardTheme _cardTheme;
ToggleButtonsThemeData _toggleButtonsData;
///////////////////////////////////////////////////////////////////////////
// Theme Data
///////////////////////////////////////////////////////////////////////////
ThemeData darkBlue() {
  _primaryColor = Color(0XFF13193B);
  _primaryColorLight = Color(0XFF3d3f66);
  _primaryColorDark = Color(0XFF000017);
  _accentColor = Colors.deepOrangeAccent[200];
  _scaffoldBackgroundColor = Color(0XFF121212);
  _barColor = Color(0XFF202020);
  _splashColor = Color(0XFF16181f);
  _appBarTheme = AppBarTheme(
    color: _barColor,
    iconTheme: IconThemeData(color: _accentColor),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: _accentColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: -1.5,
        fontFamily: _fontFamily,
      ),
    ),
  );

  _cardTheme = CardTheme(
    color: Color(0XFF15151c),
    margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );
  _buttonTheme = ButtonThemeData(
    buttonColor: _accentColor,
    textTheme: ButtonTextTheme.accent,
  );
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: _fontFamily,
    primaryColor: _primaryColor,
    primaryColorLight: _primaryColorLight,
    primaryColorDark: _primaryColorDark,
    accentColor: _accentColor,
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    appBarTheme: _appBarTheme,
    buttonTheme: _buttonTheme,
    cardTheme: _cardTheme,
    toggleButtonsTheme: _toggleButtonsData,
    toggleableActiveColor: _accentColor,
    canvasColor: _barColor,
    splashColor: _splashColor,
    typography: Typography.material2018(
      englishLike: Typography.englishLike2018,
    ),
  );
}

ThemeData lightBlue() {
  _primaryColor = Colors.indigo[500];
  _primaryColorLight = Color(0XFF757de8);
  _primaryColorDark = Color(0XFF002984);
  _accentColor = Colors.deepOrangeAccent[200];
  _barColor = _primaryColorDark;
  _scaffoldBackgroundColor = Colors.indigo[50];
  _buttonTheme = ButtonThemeData(
    buttonColor: _accentColor,
    textTheme: ButtonTextTheme.accent,
  );
  _cardTheme = CardTheme(
    margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );
  _appBarTheme = AppBarTheme(
    color: _primaryColor,
  );
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: _fontFamily,
    appBarTheme: _appBarTheme,
    primaryColor: _primaryColor,
    primaryColorLight: _primaryColorLight,
    primaryColorDark: _primaryColorDark,
    accentColor: _accentColor,
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    buttonTheme: _buttonTheme,
    cardTheme: _cardTheme,
    toggleButtonsTheme: _toggleButtonsData,
    toggleableActiveColor: _accentColor,
    splashColor: _splashColor,
    typography: Typography.material2018(
      englishLike: Typography.englishLike2018,
    ),
  );
}

ThemeData lightRed() {
  _primaryColor = Color(0xFFF0134D);
  _primaryColorLight = Color(0XFFFF5F79);
  _primaryColorDark = Color(0XFFB60026);
  _accentColor = Color(0XFF40BFC1);
  _barColor = _primaryColorDark;
  _scaffoldBackgroundColor = Colors.red[50];
  _buttonTheme = ButtonThemeData(
    buttonColor: _accentColor,
    textTheme: ButtonTextTheme.accent,
  );
  _cardTheme = CardTheme(
    margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );
  _appBarTheme = AppBarTheme(
    color: _primaryColor,
  );
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: _fontFamily,
    primaryColor: _primaryColor,
    appBarTheme: _appBarTheme,
    primaryColorLight: _primaryColorLight,
    primaryColorDark: _primaryColorDark,
    accentColor: _accentColor,
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    buttonTheme: _buttonTheme,
    cardTheme: _cardTheme,
    toggleButtonsTheme: _toggleButtonsData,
    toggleableActiveColor: _accentColor,
    splashColor: _splashColor,
    typography: Typography.material2018(
      englishLike: Typography.englishLike2018,
    ),
  );
}

ThemeData darkRed() {
  _primaryColor = Color(0xFFF0134D);
  _primaryColorLight = Color(0XFFFF5F79);
  _primaryColorDark = Color(0XFFB60026);
  _accentColor = Color(0XFF40BFC1);
  _scaffoldBackgroundColor = Color(0XFF121212);
  _barColor = Color(0XFF202020);
  _splashColor = Color(0XFF2a2a38);
  _buttonTheme = ButtonThemeData(
    buttonColor: _accentColor,
    textTheme: ButtonTextTheme.accent,
  );

  _appBarTheme = AppBarTheme(
    color: _barColor,
    iconTheme: IconThemeData(color: _accentColor),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: _accentColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: -1.5,
        fontFamily: _fontFamily,
      ),
    ),
  );
  _buttonTheme = ButtonThemeData(
    buttonColor: _accentColor,
    textTheme: ButtonTextTheme.accent,
  );
  _cardTheme = CardTheme(
    color: Color(0XFF221616),
    margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: _fontFamily,
    primaryColor: _primaryColor,
    primaryColorLight: _primaryColorLight,
    primaryColorDark: _primaryColorDark,
    accentColor: _accentColor,
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    appBarTheme: _appBarTheme,
    buttonTheme: _buttonTheme,
    cardTheme: _cardTheme,
    toggleButtonsTheme: _toggleButtonsData,
    toggleableActiveColor: _accentColor,
    canvasColor: _barColor,
    splashColor: _splashColor,
    typography: Typography.material2018(
      englishLike: Typography.englishLike2018,
    ),
  );
}

Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.LightBlue: lightBlue(),
  AppTheme.DarkBlue: darkBlue(),
  AppTheme.RedLight: lightRed(),
  AppTheme.RedDark: darkRed(),
};
