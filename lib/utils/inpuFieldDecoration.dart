import 'package:driver/utils/app_colors.dart';
import 'package:flutter/material.dart';
class CustomeInputDecoration {
  static InputDecoration formDecoration(String hint, String lable) {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(50.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide.none,
      ),
      hintText: hint,
      labelText: lable,
    );
  }

  static InputDecoration formDecorationSquare(String hint, String lable) {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),

      label: Row(
        children: [
          Text("${hint}"),
          Text(
            "*",
            style: TextStyle(color: Colors.red.shade400),
          )
        ],
      ),
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
      // labelText: '${StringClass.writeReview}',
      labelStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.darkGray),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.darkGray),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.darkGray),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.darkGray),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
