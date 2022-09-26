import 'package:clean_architecture/presentation/color_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main color
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightprimary,
    primaryColorDark: ColorManager.darkprimary,
    disabledColor:
        ColorManager.grey1, // for any think disable for exampel botton
    // cardview thme

    // app bar theme

    // botton theme

    // input decoration theme (tetxt from field )
  );
}
