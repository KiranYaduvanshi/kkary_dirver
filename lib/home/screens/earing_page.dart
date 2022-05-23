import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EarningPage extends StatelessWidget {
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
          "Earnings".text.bold.size(18).make().px(12),
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
                  height: 10,
                ),
                "May 2-May 9".text.size(12).make().px(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "${AppStrings.NGN} 0.0".text.size(20).semiBold.make(),
                    "M T W T F S S".text.size(13).make(),
                  ],
                ).px(8),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Online".text.make(),
                    "0s".text.make(),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.blue.shade100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Trips".text.make(),
                    "0".text.make(),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.blue.shade100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Points".text.make(),
                    "---".text.bold.make(),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.blue.shade100,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.blueExtraDark,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade100, blurRadius: 2),
                      ]),
                  child: Center(child: "See Details".text.white.make().p(8)),
                ).px(20).py(10),
                SizedBox(
                  height: 20,
                )
              ],
            ).px(10),
          ).px(10).py(10),
          "Balance : 0.00".text.make().px(12).py(5),
        ],
      ),
    );
  }
}
