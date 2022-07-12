import 'package:driver/home/controller/profile_screen_controller.dart';
import 'package:get/get.dart';

class ProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileScreenContoller());
  }
}
