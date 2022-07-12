import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenContoller extends GetxController {
  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    super.onInit();
  }
}
