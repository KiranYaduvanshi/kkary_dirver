import 'package:driver/home/controller/map/map_controller.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:velocity_x/velocity_x.dart';

class AcceptAndGo extends StatelessWidget {
  MapImplementController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:

            // SlidingUpPanel(
            //   minHeight: 260,
            //   maxHeight: 260,
            //   borderRadius: const BorderRadius.vertical(
            //     top: Radius.circular(15),
            //   ),
            //   parallaxEnabled: true,
            //   panelBuilder: (controller) => ClipRRect(
            //       borderRadius: const BorderRadius.only(
            //         topLeft: Radius.circular(8),
            //         topRight: Radius.circular(8),
            //       ),
            //       child: mainContainer(context)),
            //   body: Container(
            //     height: MediaQuery.of(context).size.height * .85,
            //     child: Stack(
            //       children: [
            //         maps(context),
            //         Positioned(
            //           bottom: 300,
            //           left: 0,
            //           right: 0,
            //           child: progressIndicator(context).px(10),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            Stack(
          children: [
            maps(context).expand(),
            SlidingUpPanel(
              minHeight: MediaQuery.of(context).size.height * 0.30,
              maxHeight: MediaQuery.of(context).size.height * 0.30,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              panelBuilder: (crt) => ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
                child: mainContainer(context),
              ),
            ),
            Positioned(
                bottom: 270,
                left: MediaQuery.of(context).size.width * .5 - 30,
                child: goButton()),
            Positioned(
              bottom: 180,
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
      height: 300,
      color: AppColors.white,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          items(Colors.lightBlue, "Call", Icons.call),
          items(Colors.red, "Message", Icons.message),
          items(Colors.grey, "Cancel", Icons.delete),
        ],
      ).py(18),
    );
  }

  Widget items(Color color, String ttitle, IconData iconData) {
    return Container(
      height: 90,
      width: 100,
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
            backgroundColor: Colors.grey,
            color: Colors.grey.shade300,
            value: 0.3,
          ).py(10).px(10),
        ],
      ),
    );
  }

  Widget goButton() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: AppColors.blueMedium,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 3,
            ),
          ]),
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: AppColors.blueMedium,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            boxShadow: [BoxShadow(color: Colors.white, blurRadius: 3)]
            // gradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     colors: [Colors.amber, Colors.red],
            //     stops: [.5, .5]),
            ),
        child: Center(
          child: "GO".text.white.make(),
        ),
      ).p(8),
    );
  }
}
