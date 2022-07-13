import 'package:driver/home/controller/map/map_controller.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/app_strings.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:velocity_x/velocity_x.dart';

class ReachedAndFinish extends StatelessWidget {
  MapImplementController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            maps(context).expand(),
            SlidingUpPanel(
              minHeight: 365,
              maxHeight: 365,
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
              bottom: 375,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "703 B, Ajad Nagar, Panchkula"
                      .text
                      .size(15)
                      .semiBold
                      .gray500
                      .make(),
                  const Icon(
                    Icons.check,
                    color: AppColors.greenMid,
                    size: 24,
                  )
                ],
              ),
            ],
          ).px(10),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "DROP OFF".text.gray400.make(),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "105, Phase 10, Mohali".text.size(16).semiBold.gray500.make(),
                  const Icon(
                    Icons.check,
                    color: AppColors.greenMid,
                    size: 24,
                  )
                ],
              ),
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
                  onPressed: () {},
                  child: "FINISHED RIDE".text.white.make(),
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
                  child:
                      "COD".text.fontWeight(FontWeight.w500).make().px8().py(3),
                ),
                "3.9 km".text.gray400.make(),
              ],
            ).py8(),
          ],
        ).expand(),
      ],
    );
  }
}
