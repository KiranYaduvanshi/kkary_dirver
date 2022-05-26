import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Notifications".text.white.make(),
        centerTitle: true,
        elevation: 0,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return noti();
          }).py12(),
    );
  }

  Widget noti() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10 > 0
              ? const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.circle,
                    size: 10,
                    color: Colors.red,
                  ),
                )
              : "".text.make(),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Container(
                    width: Get.width * .12,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(child: "20%".text.bold.white.make()),
                  ),
                ),
                Container(
                  width: Get.width * .75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        //  width: double.infinity,
                        // width: MediaQuery.of(context).size.width * .45,
                        //  color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Title".text.bold.size(16).black.make(),
                            "Date".text.base.make()
                          ],
                        ),
                      ),
                      "NOtification Body".text.base.size(14).make(),
                      // "USE  150 % OFF"
                      //     .text
                      //     .base
                      //     .color(Colors.grey.shade700)
                      //     .size(12)
                      //     .make()
                    ],
                  ).px(10),
                )
              ],
            ),
          )
        ],
      ),
    ).py(4).px(10);
  }
}
