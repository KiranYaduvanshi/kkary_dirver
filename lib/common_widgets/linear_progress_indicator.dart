import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/app_icons.dart';
import 'package:driver/utils/decorations.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CommonWidgets {
  static Widget search({required String title}) {
    return Container(
      decoration: CustomeBoxDecorations.circularInputField(),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: AppIcons.searchIcon,
          label: title.text
              .color(Colors.grey)
              .overflow(TextOverflow.ellipsis)
              .make(),
        ),
      ).px20(),
    ).py8();
  }

  static Widget linearProgressIndicator(
      {required String text, required double value}) {
    return SizedBox(
      height: 30,
      child: Stack(
        children: [
          LinearProgressIndicator(
            minHeight: 35,
            value: value,
            backgroundColor: AppColors.blueDark,
            color: AppColors.blueMedium,
          ),
          Align(
            child: "  $text".text.lg.color(Colors.white).make(),
            alignment: Alignment.centerLeft,
          ).px8(),
        ],
      ),
    );
  }

  Widget commonButton(
      {required Function action,
      Color bgColor = AppColors.blueLight,
      Color strokeColor = AppColors.blueLight,
      Color textColor = AppColors.white,
      required BuildContext ctx,
      required String title}) {
    return InkWell(
      onTap: () => action(),
      child: Container(
        width: MediaQuery.of(ctx).size.width * .8,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1.0,
              color: strokeColor,
            )),
        child: title.text.semiBold
            .color(textColor)
            .size(15)
            .make()
            .centered()
            .py(10),
      ),
    );
  }
}
