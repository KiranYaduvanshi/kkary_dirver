import 'package:driver/home/controller/map/map_controller.dart';
import 'package:driver/home/controller/otp_controller.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/app_strings.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:velocity_x/velocity_x.dart';

class PickUpLocation extends StatelessWidget {
  MapImplementController controller = Get.find();
  // OtpController otpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            maps(context),
            SlidingUpPanel(
              minHeight: 330,
              maxHeight: 330,
              // minHeight: MediaQuery.of(context).size.height * 0.45,
              // maxHeight: MediaQuery.of(context).size.height * 0.45,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              panelBuilder: (crt) => ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: mainContainer(context),
              ),
            ),
            Positioned(
              bottom: 350,
              left: 0,
              right: 0,
              child: progressIndicator(context).px(12),
            ),
          ],
        ),
      ),
    );
  }

  Widget maps(BuildContext context) {
    return Container(
      child: Obx(
        () => GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          onTap: (value) async {
            controller.getAddressFromLatLng(
                Position(latitude: value.latitude, longitude: value.longitude));
            controller.markers.clear();
            controller.markers.add(
              Marker(
                consumeTapEvents: true,
                markerId: const MarkerId("home"),
                draggable: true,
                onDragEnd: (value) {},
                position: LatLng(value.latitude, value.longitude),
              ),
            );
          },
          initialCameraPosition: CameraPosition(
              target: LatLng(
                controller.currentPosition.value.latitude,
                controller.currentPosition.value.longitude,
              ),
              zoom: 14),
          markers: Set<Marker>.of(controller.markers),
          onMapCreated: (GoogleMapController ctr) {
            controller.mapController = ctr;
          },
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    return Container(
      height: 500,
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: infoCard(),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "PICK UP".text.gray400.make(),
              const SizedBox(
                height: 8,
              ),
              "703 B, Ajad Nagar, Panchkula"
                  .text
                  .size(16)
                  .semiBold
                  .gray500
                  .make(),
            ],
          ).px(10),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Center(
            child: SizedBox(
                width: Get.width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: AppColors.blueLight),
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: "OTP".text.white.make(),
                )),
          ).expand(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              items(Colors.lightBlue, "Call", Icons.call),
              items(Colors.red, "Message", Icons.message),
              items(Colors.grey, "Cancel", Icons.delete),
            ],
          ).p(8),
        ],
      ),
    );
  }

  Widget items(Color color, String ttitle, IconData iconData) {
    return Container(
      height: 80,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade100, blurRadius: 3),
        ],
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            ttitle.text.white.make(),
          ],
        ),
      ),
    ).px(10);
  }

  Widget progressIndicator(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColors.blueExtraDark),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: AppStrings.reachingDestination.text
                .size(14)
                .color(Colors.white)
                .make()
                //  .py(6)
                .px(10),
          ),
          "14 min".text.size(16).color(Colors.white).base.make().px(10),
          LinearProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.grey.shade300,
            value: 0.3,
          ).py(10).px(10),
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

  showAlertDialog(BuildContext context) {
    Widget col = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(primary: AppColors.red),
            child: "Cancel".text.white.make(),
          ).px(4),
        ),
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(primary: AppColors.blueLight),
            child: "Procced".text.white.make(),
          ).px(4),
        )
      ],
    ).py(10);

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          "Enter OTP".text.make(),
          Form(
            key: controller.formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                otpBoxOne(controller.one, controller.focusone, context),
                otpBoxTwo(controller.two, controller.focustwo, context),
                otpBoxThree(controller.three, controller.focusthree, context),
                otpBoxFour(controller.four, controller.focusfour, context),
              ],
            ),
          ).py(8),
        ],
      ),
      actions: [col],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget otpBoxOne(
      TextEditingController controller, FocusNode focus, BuildContext context) {
    return Card(
      elevation: 14,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: AppColors.blueLight, width: 1)),
      child: Container(
        height: 40,
        width: 35,
        alignment: Alignment.center,
        child: TextFormField(
          keyboardType: TextInputType.number,
          textAlignVertical: TextAlignVertical.center,

          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(1),
          ],
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },

          // validator: (value) {
          //   if (controller.text.length == 1) {
          //     print(controller.text.length);
          //     FocusScope.of(context).nextFocus();
          //   }
          // },
        ),
      ),
    ).p4();
  }

  Widget otpBoxTwo(
      TextEditingController controller, FocusNode focus, BuildContext context) {
    return Card(
      elevation: 14,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: AppColors.blueLight, width: 1)),
      child: Container(
        height: 40,
        width: 35,
        alignment: Alignment.center,
        child: TextFormField(
          keyboardType: TextInputType.number,
          focusNode: focus,
          textAlignVertical: TextAlignVertical.center,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(1),
          ],
          controller: controller,
          autovalidateMode: AutovalidateMode.disabled,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            } else if (value.length == 0) {
              FocusScope.of(context).previousFocus();
            }
          },
          // validator: (value) {
          //   if (controller.text.length == 1) {
          //     print(controller.text.length);
          //     FocusScope.of(context).nextFocus();
          //   }
          // }
        ),
      ),
    ).p4();
  }

  Widget otpBoxThree(
      TextEditingController controller, FocusNode focus, BuildContext context) {
    MapImplementController _controller = Get.find();
    return Card(
      elevation: 14,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: AppColors.blueLight, width: 1)),
      child: Container(
        height: 40,
        width: 35,
        alignment: Alignment.center,
        child: TextFormField(
          focusNode: _controller.focusthree,
          keyboardType: TextInputType.number,
          textAlignVertical: TextAlignVertical.center,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(1),
          ],
          controller: controller,
          autovalidateMode: AutovalidateMode.disabled,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            } else if (value.length == 0) {
              FocusScope.of(context).previousFocus();
            }
          },
          // validator: (value) {
          //   if (controller.text.length == 1) {
          //     print(controller.text.length);
          //     FocusScope.of(context).nextFocus();
          //   }
          // }
        ),
      ),
    ).p4();
  }

  Widget otpBoxFour(
      TextEditingController controller, FocusNode focus, BuildContext context) {
    return Card(
      elevation: 14,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: AppColors.blueLight, width: 1)),
      child: Container(
        height: 40,
        width: 35,
        alignment: Alignment.center,
        child: TextFormField(
          focusNode: focus,
          keyboardType: TextInputType.number,
          textAlignVertical: TextAlignVertical.center,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(1),
          ],
          controller: controller,
          autovalidateMode: AutovalidateMode.disabled,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).unfocus();
            } else if (value.length == 0) {
              FocusScope.of(context).previousFocus();
            }
          },
          // validator: (value) {
          //   if (controller.text.length == 1) {
          //
          //     FocusScope.of(context).unfocus();
          //   }
          // },
        ),
      ),
    ).p4();
  }
}
