import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController one = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController four = TextEditingController();
  FocusNode focusone = FocusNode();
  FocusNode focustwo = FocusNode();
  FocusNode focusthree = FocusNode();
  FocusNode focusfour = FocusNode();

  submit() {
    if (formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      print("df");
    }
  }
}
