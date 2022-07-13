import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:driver/home/controller/history_controller.dart';
import 'package:driver/home/controller/home_controller.dart';
import 'package:driver/home/screens/side_navigation.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/app_strings.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/src/flutter/widgets.dart';

class History extends StatelessWidget {
  History({Key? key}) : super(key: key);
  final HistoryController _controller = HistoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SideNavigation(),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.blueLight,
        title: "History".text.white.make(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
            () => DatePicker(DateTime.now(),
                controller: _controller.controller,
                initialSelectedDate: _controller.selectedValue.value,
                selectionColor: AppColors.orangeLight,
                selectedTextColor: AppColors.white,
                daysCount: 30,
                monthTextStyle: TextStyle(fontSize: 12),
                inactiveDates: [
                  DateTime.now().add(Duration(days: 3)),
                  DateTime.now().add(Duration(days: 7))
                ], onDateChange: (date) {
              _controller.selectedValue.value = date;
            }),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    card("imagePath", "Total Jobs", "10",
                        AppColors.orangeExtraLight),
                    card("imagePath", "Total Earnings", "${AppStrings.NGN}1234",
                        AppColors.orangeMidle),
                  ],
                ),
              ],
            ),
          ),
          ListView.builder(itemCount: 5,itemBuilder: (BuildContext context , int index){
            return jobs(index).p4();
          }, ).expand()
        ],
      ),
    );
  }

  Widget jobs(int index){
    return Container(
      decoration: BoxDecoration(color : Colors.white,borderRadius: BorderRadius.circular(12),
      boxShadow: [BoxShadow(offset: Offset(0,1),spreadRadius: 2 , blurRadius: 2 , color: Colors.grey.shade400)]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            infoCard(),
            const Divider(),
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

          ],
        ),
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


  Widget card(String imagePath, String title, String price, Color backColor) {
    return Container(
      width: Get.width * .42,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backColor,
      ),
      child: Row(
        children: [
          Icon(
            Icons.style,
            size: 25,
          ).px(6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              title.text.color(AppColors.brown).size(17).make(),
              price.text.size(17).semiBold.make(),
            ],
          ),
        ],
      ),
    );
  }
}
