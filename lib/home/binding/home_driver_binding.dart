import 'package:driver/home/controller/home_driver_controller.dart';
import 'package:get/get.dart';

class HomeDriverBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeDriverController());
  }

}