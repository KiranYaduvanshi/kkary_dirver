import 'package:driver/home/controller/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(NotificationController());
  }

}