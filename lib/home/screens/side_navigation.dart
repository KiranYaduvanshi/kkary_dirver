import 'package:driver/routes/app_routes.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';

class SideNavigation extends StatelessWidget {
  const SideNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .8,
      color: Colors.white,
      child: ListView(
        children: [
          drawer(),
          card(ImagePaths.ic_documents, "Documents", "path"),
          card(ImagePaths.ic_payment, "Payment", "path"),
          card(ImagePaths.ic_taxinfo, "Tex Info", "path"),
          card(ImagePaths.ic_about, "About", "path"),
          card(ImagePaths.ic_info, "Edit info", "path"),
          card(ImagePaths.ic_notifications, "Notifications",
              AppRoutes.notifications),
          card(ImagePaths.ic_setting, "App Settings", "path"),
          card(ImagePaths.ic_logout, "Logout", "path"),
        ],
      ),
    );
  }

  DrawerHeader drawer() {
    return DrawerHeader(
      decoration: BoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 42,
            backgroundColor: Colors.grey.shade300,
            child: const CircleAvatar(
              radius: 38,
              backgroundColor: Colors.white,
              foregroundImage: AssetImage(ImagePaths.imgUser),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  "Vehicles".text.size(20).make(),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.edit,
                      color: AppColors.blueLight,
                      size: 18,
                    ),
                  ),
                ],
              ),
              "No vehicle selected"
                  .text
                  .color(Colors.grey.shade400)
                  .make()
                  .py(4),
            ],
          ).p12(),
        ],
      ),
    );
  }

  Widget card(String icon, String title, String route) {
    return InkWell(
      onTap: () {
        if(title == "Logout"){
          Get.offAllNamed(AppRoutes.login);
        }else if (route != "path" ) {
          Get.toNamed(route);
        }
      },
      child: Column(
        children: [
          ListTile(
            leading: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(icon),
            ),
            title: title.text.black.fontWeight(FontWeight.w400).size(18).make(),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
