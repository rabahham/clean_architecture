import 'package:clean_architecture/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyl(double fontSize, FontWeight fontWeigth, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeigth,
  );
}

// regular style

TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyl(fontSize, FontWightManager.regular, color);
}

// Medium style

TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyl(fontSize, FontWightManager.medium, color);
}

// Light style

TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyl(fontSize, FontWightManager.light, color);
}

// Bold style

TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyl(fontSize, FontWightManager.bold, color);
}

// SemiBold style

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyl(fontSize, FontWightManager.semiBold, color);
}
