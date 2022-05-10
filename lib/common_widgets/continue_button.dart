import 'package:driver/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButtons {
  Widget continueButton({required Function function}) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
          boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)]),
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        child: "Continue".text.make().px(10).py(10),
        style: ElevatedButton.styleFrom(
          primary: AppColors.blueDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 15.0,
        ),
      ).p20(),
    );
  }

  Widget button({required String text, required Color color}) {
    return ElevatedButton(
      onPressed: () {},
      child: text.text.make(),
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 6,
      ),
    ).p16();
  }
}
