import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class TestAnimationController extends GetxController with GetSingleTickerProviderStateMixin{

  late AnimationController controller ;
  late Animation animation;
  late Animation animationTwo;

  @override
  void onInit() {
    controller = AnimationController(vsync: this , duration: (Duration(seconds: 1)))..repeat( reverse: false);

    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: .3*pi);
    //   }
    //   else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // }

    animation = Tween(begin: 0 * pi , end: 3*pi).animate(controller);
    animationTwo = Tween(begin: 200.0 , end: 240.0).animate(controller);
    // animationThree = Tween(begin: 200.0 , end: 240.0).animate(controller);
    controller.forward();
    super.onInit();
  }
}