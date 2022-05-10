import 'package:driver/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomeBoxDecorations {
  static BoxDecoration circularBorderLightBlue() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: AppColors.blueExtraLight),
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
    );
  }

  static BoxDecoration circularInputField(
      {Color borderColor = Colors.black,
      Color backColor = Colors.white,
      double border = 25}) {
    return BoxDecoration(
      color: backColor,
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.all(Radius.circular(border)),
    );
  }

  static BoxDecoration circularBorderLinearGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
          colors: [AppColors.blueDark, AppColors.blueExtraLight],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      borderRadius: BorderRadius.all(Radius.circular(0.0)),
    );
  }

  static BoxDecoration circularAgree(
      {Color borderColor = Colors.black, required Color backColor}) {
    return BoxDecoration(
      color: backColor,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }
}
