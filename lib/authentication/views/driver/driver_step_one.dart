import 'package:driver/routes/app_routes.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DriverStepOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.blueMedium,
        elevation: 0,
        leading: const BackButton(color: AppColors.white),
        title: "Kkary".text.size(18).make(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            "WelCome Rahul".text.size(16).bold.make().px(10),
            "Required Steps".text.size(13).make().px(10).py(5),
            const SizedBox(
              height: 10,
            ),
            for (int i = 0; i < 4; i++) listItems(context),
          ],
        ),
      ),
    );
  }

  Widget listItems(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.driverStepTwo);
        },
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.document_scanner,
                    size: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Profile Photo".text.semiBold.size(14).make(),
                      "Get Stated".text.size(12).make()
                    ],
                  ).px(10),
                ],
              ).px(10),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: AppColors.blueMedium,
              )
            ],
          ),
          const Divider(
            thickness: 1,
          )
        ]).px(12),
      ),
    ).py(8);
  }
}
