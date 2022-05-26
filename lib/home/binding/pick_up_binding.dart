import 'package:driver/home/controller/map/map_controller.dart';
import 'package:driver/home/controller/pick_up_conatroller.dart';
import 'package:get/get.dart';

class PickUpLocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PickUpLocationController());
    Get.lazyPut(() => MapImplementController());
  }
}
