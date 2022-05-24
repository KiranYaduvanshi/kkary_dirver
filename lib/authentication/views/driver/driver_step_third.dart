import 'package:driver/routes/app_routes.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DriverStepThird extends StatelessWidget {
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
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                "Take Photo of your ".text.size(16).bold.make().px(10),
                "Driving Licence ".text.size(16).bold.make().px(10),
                const SizedBox(
                  height: 10,
                ),
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."
                    .text
                    .black
                    .size(14)
                    .make()
                    .px(10),
                const Divider(
                  thickness: 1,
                ).py(8),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      ImagePaths.license,
                      height: 160,
                      width: 240,
                      fit: BoxFit.cover,
                    ),
                  ),
                ).py(20),
              ],
            ),
          ).expand(),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            width: MediaQuery.of(context).size.width * 1,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.blueDark),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                onPressed: () {
                  Get.toNamed(AppRoutes.driverReview);
                },
                child: "Take Photo"
                    .text
                    .white
                    .bold
                    .align(TextAlign.center)
                    .make()
                    .wFourFifth(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
