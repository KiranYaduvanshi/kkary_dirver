import 'package:driver/home/controller/map/map_controller.dart';
import 'package:driver/home/controller/otp_controller.dart';
import 'package:get/get.dart';

class MapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapImplementController());
    // Get.lazyPut(() => OtpController());
  }
}
