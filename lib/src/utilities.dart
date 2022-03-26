import 'package:flutter/material.dart';

extension MediaQueryShortcuts on BuildContext {
  // Size shortcuts
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get padTop => MediaQuery.of(this).padding.top;
  double get padBottom => MediaQuery.of(this).padding.bottom;

  // Theme shortcuts
  ThemeData get theme => Theme.of(this);

  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;
  Brightness get brightness => Theme.of(this).brightness;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isLightMode => Theme.of(this).brightness == Brightness.dark;

  bool get isPlatformDark =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;
  bool get isPlatformLight =>
      MediaQuery.of(this).platformBrightness == Brightness.light;

  BottomNavigationBarThemeData get bottomNavTheme =>
      Theme.of(this).bottomNavigationBarTheme;
  IconThemeData get iconTheme => Theme.of(this).iconTheme;
  CardTheme get cardTheme => Theme.of(this).cardTheme;
}

/// Shortcut for theme colors
extension ColorsShortcut on BuildContext {
  ColorScheme get scheme => Theme.of(this).colorScheme;

  Color get primary => Theme.of(this).primaryColor;
  Color get primaryDark => Theme.of(this).primaryColorDark;
  Color get primaryLight => Theme.of(this).primaryColorLight;

  Color get bg => Theme.of(this).backgroundColor;
  Color get scaffoldBg => Theme.of(this).scaffoldBackgroundColor;

  Color get errorColor => Theme.of(this).errorColor;
  Color get hintColor => Theme.of(this).hintColor;
  Color get focusColor => Theme.of(this).focusColor;
  Color get hoverColor => Theme.of(this).hoverColor;
  Color get cardColor => Theme.of(this).cardColor;
  Color get shadowColor => Theme.of(this).shadowColor;
  Color get canvasColor => Theme.of(this).canvasColor;
  Color get bottomAppBarColor => Theme.of(this).bottomAppBarColor;
  Color get dividerColor => Theme.of(this).dividerColor;
  Color get highlightColor => Theme.of(this).highlightColor;
  Color get splashColor => Theme.of(this).splashColor;
  Color get selectedRowColor => Theme.of(this).selectedRowColor;

  Color get unselectedWidgetColor => Theme.of(this).unselectedWidgetColor;
  Color get disabledColor => Theme.of(this).disabledColor;
  Color get secondaryHeaderColor => Theme.of(this).secondaryHeaderColor;
  Color get dialogBackgroundColor => Theme.of(this).dialogBackgroundColor;
  Color get indicatorColor => Theme.of(this).indicatorColor;
  Color get toggleableActiveColor => Theme.of(this).toggleableActiveColor;
}

/// Shortcut for theme text styles
extension TextThemeShortcut on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  // 2021 styles
  TextStyle? get bodySm => Theme.of(this).textTheme.bodySmall;
  TextStyle? get bodyMd => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodyLg => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get titleSm => Theme.of(this).textTheme.titleSmall;
  TextStyle? get titleMd => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleLg => Theme.of(this).textTheme.titleLarge;

  TextStyle? get headlineSm => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get headlineMd => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineLg => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get displaySm => Theme.of(this).textTheme.displaySmall;
  TextStyle? get displayMd => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displayLg => Theme.of(this).textTheme.displayLarge;

  TextStyle? get labelSm => Theme.of(this).textTheme.labelSmall;
  TextStyle? get labelMd => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelLg => Theme.of(this).textTheme.labelLarge;

  // 2018 styles
  TextStyle? get overline => Theme.of(this).textTheme.overline;
  TextStyle? get caption => Theme.of(this).textTheme.caption;
  TextStyle? get button => Theme.of(this).textTheme.button;

  TextStyle? get headline1 => Theme.of(this).textTheme.headline1;
  TextStyle? get headline2 => Theme.of(this).textTheme.headline2;
  TextStyle? get headline3 => Theme.of(this).textTheme.headline3;
  TextStyle? get headline4 => Theme.of(this).textTheme.headline4;
  TextStyle? get headline5 => Theme.of(this).textTheme.headline5;
  TextStyle? get headline6 => Theme.of(this).textTheme.headline6;

  TextStyle? get subtitle1 => Theme.of(this).textTheme.subtitle1;
  TextStyle? get subtitle2 => Theme.of(this).textTheme.subtitle2;

  TextStyle? get body1 => Theme.of(this).textTheme.bodyText1;
  TextStyle? get body2 => Theme.of(this).textTheme.bodyText2;
}

/// Shortcut for theme primary text styles
extension PrimaryextThemeShortcut on BuildContext {
  TextTheme get textTheme => Theme.of(this).primaryTextTheme;

  // 2021 styles
  TextStyle? get bodySmPr => Theme.of(this).primaryTextTheme.bodySmall;
  TextStyle? get bodyMdPr => Theme.of(this).primaryTextTheme.bodyMedium;
  TextStyle? get bodyLgPr => Theme.of(this).primaryTextTheme.bodyLarge;

  TextStyle? get titleSmPr => Theme.of(this).primaryTextTheme.titleSmall;
  TextStyle? get titleMdPr => Theme.of(this).primaryTextTheme.titleMedium;
  TextStyle? get titleLgPr => Theme.of(this).primaryTextTheme.titleLarge;

  TextStyle? get headlineSmPr => Theme.of(this).primaryTextTheme.headlineSmall;
  TextStyle? get headlineMdPr => Theme.of(this).primaryTextTheme.headlineMedium;
  TextStyle? get headlineLgPr => Theme.of(this).primaryTextTheme.headlineLarge;

  TextStyle? get displaySmPr => Theme.of(this).primaryTextTheme.displaySmall;
  TextStyle? get displayMdPr => Theme.of(this).primaryTextTheme.displayMedium;
  TextStyle? get displayLgPr => Theme.of(this).primaryTextTheme.displayLarge;

  TextStyle? get labelSmPr => Theme.of(this).primaryTextTheme.labelSmall;
  TextStyle? get labelMdPr => Theme.of(this).primaryTextTheme.labelMedium;
  TextStyle? get labelLgPr => Theme.of(this).primaryTextTheme.labelLarge;

  // 2018 styles
  TextStyle? get overlinePr => Theme.of(this).primaryTextTheme.overline;
  TextStyle? get captionPr => Theme.of(this).primaryTextTheme.caption;
  TextStyle? get buttonPr => Theme.of(this).primaryTextTheme.button;

  TextStyle? get headline1Pr => Theme.of(this).primaryTextTheme.headline1;
  TextStyle? get headline2Pr => Theme.of(this).primaryTextTheme.headline2;
  TextStyle? get headline3Pr => Theme.of(this).primaryTextTheme.headline3;
  TextStyle? get headline4Pr => Theme.of(this).primaryTextTheme.headline4;
  TextStyle? get headline5Pr => Theme.of(this).primaryTextTheme.headline5;
  TextStyle? get headline6Pr => Theme.of(this).primaryTextTheme.headline6;

  TextStyle? get subtitle1Pr => Theme.of(this).primaryTextTheme.subtitle1;
  TextStyle? get subtitle2Pr => Theme.of(this).primaryTextTheme.subtitle2;

  TextStyle? get body1Pr => Theme.of(this).primaryTextTheme.bodyText1;
  TextStyle? get body2Pr => Theme.of(this).primaryTextTheme.bodyText2;
}
