import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
part '_dimention_theme.dart';
part '_color_theme_extention.dart';
part '_webool_colors.dart';
part '_buttons_theme.dart';
part '_input_decoration_theme.dart';
part '_text_theme.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  extensions: [
    Dimensions(
      spaces: _spaceDimensions,
      insets: _insetsDimensions,
      borderWidths: _borderWidthDimensions,
      radii: _radiiDimensions,
    ),
    weboolColorsColorsExtension(true),
  ],
  elevatedButtonTheme: _lightElevatedButton,
  inputDecorationTheme: _inputDecorationLight,
  textTheme: _lightTextTheme,
);

final darkTheme = ThemeData(
  useMaterial3: true,
  extensions: [
    Dimensions(
      spaces: _spaceDimensions,
      insets: _insetsDimensions,
      borderWidths: _borderWidthDimensions,
      radii: _radiiDimensions,
    ),
    weboolColorsColorsExtension(true),
  ],
  elevatedButtonTheme: _lightElevatedButton,
  inputDecorationTheme: _inputDecorationLight,
  textTheme: _lightTextTheme,
);
