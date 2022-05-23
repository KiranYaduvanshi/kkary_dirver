import 'package:driver/routes/app_routes.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DriverStepTwo extends StatelessWidget {
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
      body: Column(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              "Take Your Profile  Photo".text.size(16).bold.make().px(10),
              "Required Steps".text.size(13).make().px(10).py(5),
              const SizedBox(
                height: 10,
              ),
              "Reference site about Lorem Ipsum, giving information on its origins"
                  .text
                  .black
                  .size(14)
                  .make()
                  .py(3)
                  .px(10),
              const Divider(
                thickness: 1,
              ),
              for (int i = 1; i < 4; i++) stepsList(context, i),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/mask_group.png",
                    height: 150,
                    width: 150,
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
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
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
                Get.toNamed(AppRoutes.driverStepThird);
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
      ]),
    );
  }

  Widget stepsList(BuildContext context, int index) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "${index}.".text.make(),
          Container(
            width: MediaQuery.of(context).size.width * .9,
            child:
                "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs."
                    .text
                    .size(14)
                    .black
                    .maxLines(2)
                    .make(),
          ),
        ],
      ),
    ).py(8).px(10);
  }
}
