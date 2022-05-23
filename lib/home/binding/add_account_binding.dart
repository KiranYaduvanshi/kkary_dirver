import 'package:get/get.dart';

class AddBankAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBankAccountBinding());
  }
}
