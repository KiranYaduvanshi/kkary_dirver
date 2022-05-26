import 'package:driver/home/controller/driver_details_controller.dart';
import 'package:get/get.dart';

class DriverDetailsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DriverDetailsController());
  }

}