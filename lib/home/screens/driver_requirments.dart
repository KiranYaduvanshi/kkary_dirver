import 'package:driver/routes/app_routes.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DriverRequirments extends StatelessWidget {
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
          const SizedBox(
            height: 20,
          ),
          "Driver requirments".text.size(16).bold.make().px(12),
          _requirmentList("Driving Licence - Front", "Needs your Attention",
              Icons.warning, AppColors.lightPink, Colors.orange),
          _requirmentList("Pan Card", "Get Started", Icons.arrow_forward_ios,
              AppColors.extraLightBlue, Colors.black),
          _requirmentList("Aadhaar Card", "Required soon", Icons.warning,
              AppColors.lightPink, Colors.orange),
          _requirmentList("Bank Passbook/Cheque", "Optional",
              Icons.arrow_forward_ios, AppColors.extraLightBlue, Colors.black),
        ],
      ),
    );
  }

  Widget _requirmentList(String title, String subTitle, IconData icon,
      Color color, Color iconColor) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 1)]),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.addBankAccount);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title.text.make(),
                subTitle.text.make(),
              ],
            ),
            Icon(
              icon,
              size: 18,
              color: iconColor,
            ),
          ],
        ).p(16),
      ),
    ).py(6).px(12);
  }
}
