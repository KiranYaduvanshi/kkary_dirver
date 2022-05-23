import 'package:driver/home/controller/earing_controller.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:get/get.dart';

class EaringBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EaringController());
  }
}
