import 'package:driver/home/controller/driver_details_controller.dart';
import 'package:driver/home/screens/side_navigation.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/app_strings.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/src/flutter/widgets.dart';

class DriverDetails extends StatelessWidget {
  DriverDetails({Key? key}) : super(key: key);

  final DriverDetailsController _controller = DriverDetailsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SideNavigation(),
      appBar: AppBar(
        backgroundColor: AppColors.blueLight,
        title: "Ride Details".text.white.make(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: infoCard(),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: userInfo(),
          ),
          SizedBox(
              width: Get.width * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: AppColors.blueLight),
                onPressed: () {},
                child: "Rate Now".text.white.make(),
              )),
        ],
      ),
    );
  }

  Widget infoCard() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 1,
                color: Colors.grey.shade300,
              ),
              BoxShadow(
                offset: Offset(0, 3),
                color: Colors.grey.shade300,
              ),
            ],
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.asset(
                ImagePaths.imgUser,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Sanjay Dubey".text.semiBold.size(18).make(),
                "${AppStrings.NGN}155.00".text.size(18).semiBold.make(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.yellowGold,
                  ),
                  child: "Google Pay"
                      .text
                      .fontWeight(FontWeight.w500)
                      .make()
                      .px8()
                      .py(3),
                ),
                "3.9 km".text.gray400.make(),
              ],
            ).py8(),
          ],
        ).expand(),
      ],
    );
  }

  Widget userInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "PICK UP".text.gray400.make(),
        const SizedBox(
          height: 8,
        ),
        "703 B, Ajad Nagar, Panchkula".text.size(18).semiBold.gray500.make(),
        const Divider().py8(),
        "DROP OFF".text.gray400.make(),
        const SizedBox(
          height: 8,
        ),
        "105, Phase 10, Mohali".text.size(18).semiBold.gray500.make(),
        const Divider().py8(),
        "Noted".text.gray400.make(),
        const SizedBox(
          height: 8,
        ),
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam."
            .text
            .maxLines(5)
            .semiBold
            .gray500
            .make(),
        const Divider().py8(),
        "TRIP FAIR".text.gray400.make(),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "COD".text.size(18).semiBold.make(),
            "${AppStrings.NGN}210.30".text.size(18).gray500.make(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Discount".text.size(18).semiBold.make(),
            "${AppStrings.NGN}20.10".text.size(18).gray500.make(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Paid Amount".text.size(18).semiBold.make(),
            "${AppStrings.NGN}180.0".text.size(18).gray500.make(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
      ],
    );
  }
}
