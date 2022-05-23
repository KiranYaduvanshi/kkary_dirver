import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddBankAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueLight,
        elevation: 0,
        leading: const BackButton(
          color: AppColors.white,
        ),
        title: "Kkary".text.size(18).make(),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          "Add Bank Account".text.bold.size(18).make().px(12),
          Container(
            decoration: BoxDecoration(
                color: AppColors.lightBlueLight,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade100, blurRadius: 2)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                "Your Balance".text.size(12).make().px(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "${AppStrings.NGN} 0.0".text.size(20).semiBold.make(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ],
                ).px(8),
                Container(
                  width: MediaQuery.of(context).size.width * .4,
                  child: "Add Bank Account Where you want to receive payments"
                      .text
                      .semiBold
                      .size(18)
                      .maxLines(3)
                      .make(),
                ).px(10).py(8),
                Container(
                  width: 160,
                  decoration: BoxDecoration(
                      color: AppColors.blueExtraDark,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade100, blurRadius: 2),
                      ]),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                      "Add Bank Account".text.white.size(12).make().px(4),
                    ],
                  ).p(6),
                ).py(8),
                const SizedBox(
                  height: 30,
                )
              ],
            ).px(10),
          ).px(10).py(10),
        ],
      ),
    );
  }
}
