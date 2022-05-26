import 'package:driver/routes/app_routes.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeLaunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                ImagePaths.homeLaunch,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 50,
                left: MediaQuery.of(context).size.width * .5 - 75,
                child: Image.asset(
                  ImagePaths.logo,
                  height: 150,
                  width: 150,
                )),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.driverStepOne);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:
                      "Login".text.semiBold.size(15).make().py(12).centered(),
                ).px(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
