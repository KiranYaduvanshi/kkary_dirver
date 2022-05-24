import 'package:driver/home/controller/home_driver_controller.dart';
import 'package:driver/home/screens/side_navigation.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/app_strings.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/src/flutter/widgets.dart';

class DriverHome extends StatelessWidget {
  DriverHome({Key? key}) : super(key: key);
  final HomeDriverController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SideNavigation(),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() => (_controller.online.value ? "Online" : "Offline")
            .text
            .white
            .make()),
        actions: [
          Obx(
            () => FlutterSwitch(
              activeToggleColor: AppColors.green,
              width: 50.0,
              height: 25.0,
              toggleSize: 25.0,
              value: _controller.online.value,
              activeColor: Colors.white,
              inactiveToggleColor: Colors.white,
              padding: 2,
              inactiveColor: Colors.grey.shade300,
              borderRadius: 30.0,
              onToggle: (val) {
                _controller.online.value = val;
              },
            ).px(8),
          ),
        ],
      ),
      body: Obx(
        () => _controller.online.value ? offline() : online(),
      ),
      // youOffline(),
      // newRequests(),
    );
  }

  Widget offline() {
    return Container(
      color: Colors.grey.shade100,
      height: Get.height * 1,
      child: Column(
        children: [
          newRequests(),
          rideRequests().expand(),
        ],
      ),
    );
  }

  Widget online() {
    return Stack(
      children: [
        SlidingUpPanel(
          minHeight: 230,
          maxHeight: 230,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(8),
          ),
          panel: homeInfo(),
          body: Container(
            color: Colors.white,
            child:
                Center(child: "Map Is Going To Be Here".text.bold.black.make()),
          ),
        ),
        SizedBox(height: 70, width: Get.width * 1, child: youOffline()),
      ],
    );
  }

  Widget rideRequests() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
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
                              "${AppStrings.NGN}155.00"
                                  .text
                                  .size(18)
                                  .semiBold
                                  .make(),
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
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "PICK UP".text.gray400.make(),
                      const SizedBox(
                        height: 8,
                      ),
                      "703 B, Ajad Nagar, Panchkula".text.size(16).make(),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 20.0),
                  child: Container(
                    width: Get.width * 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: "Accept".text.make().p4(),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget newRequests() {
    return Container(
      width: Get.width * 1,
      color: AppColors.yellowGold,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: "You have 4 new requests".text.size(16).make(),
      ),
    );
  }

  Widget youOffline() {
    return Container(
      color: AppColors.yellowGold,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImagePaths.ic_setting,
            color: Colors.black,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ).p(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "You are Offline !"
                  .text
                  .fontWeight(FontWeight.w500)
                  .size(18)
                  .make(),
              "Go online to start accepting jobs".text.make(),
            ],
          )
        ],
      ),
    );
  }

  Widget homeInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -3),
            blurRadius: 3,
            color: Colors.grey.shade300,
          ),
        ],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.blueLight,
                  radius: 25,
                  child: CircleAvatar(
                    radius: 24,
                    foregroundImage: AssetImage(ImagePaths.imgUser),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Rajesh Kumar".text.size(16).make(),
                        "${AppStrings.NGN}1350.00".text.make(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Basic level".text.gray400.make(),
                        "Earned".text.gray400.make(),
                      ],
                    ),
                  ],
                ).expand(),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.blueLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  status(ImagePaths.ic_about, "120.2", "HOURS ONLINE"),
                  status(ImagePaths.ic_about, "230 KM", "TOTAL DISTANCE"),
                  status(ImagePaths.ic_about, "20", "TOTAL JOBS"),
                ],
              ).py20(),
            ),
          ],
        ),
      ),
    );
  }

  Widget status(String path, String value, String title) {
    return Column(
      children: [
        Image.asset(
          path,
          color: Colors.white,
          height: 30,
          width: 30,
        ),
        value.text.white.semiBold.size(16).make().py(4),
        title.text.white.fontWeight(FontWeight.w400).size(6).make(),
      ],
    );
  }
}
