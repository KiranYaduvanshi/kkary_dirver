import 'package:driver/home/controller/driverRequsirmentContoller.dart';
import 'package:get/get.dart';

class DriverRequirmentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DriverRequirmentController());
  }
}
