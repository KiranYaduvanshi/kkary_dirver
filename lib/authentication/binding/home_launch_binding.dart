import 'package:driver/authentication/controller/home_launch_controller.dart';
import 'package:get/get.dart';

class HomeLaunchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLaunchControler());
  }
}
