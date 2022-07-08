import 'dart:math';

import 'package:driver/home/controller/test_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class TestAnimation extends StatelessWidget {
  TestAnimation({Key? key}) : super(key: key);

  TestAnimationController controller = Get.put(TestAnimationController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controller.animation,
        builder: (_, Widget? child) {
          return
              // Transform.rotate(
              // origin: Offset(0,60),
              // angle:   Tween(begin: 0.0 , end: 2.0 * pi).animate(controller.controller).value,
              Transform(
                origin: Offset(controller.animationTwo.value / 2,
                    controller.animationTwo.value / 2),
            transform: Matrix4.rotationX(Tween(begin: 0 * pi, end: 1 * pi)
                .animate(controller.controller)
                .value),
            child: Transform(
              transform: Matrix4.rotationY(Tween(begin: 0 * pi, end: 2 * pi)
                  .animate(controller.controller)
                  .value),
              origin: Offset(controller.animationTwo.value / 2,
                  controller.animationTwo.value / 2),
              child: Container(
                height: controller.animationTwo.value,
                width: controller.animationTwo.value,
                alignment: Alignment.center,
                child:
                    // Text("Mayank" , style: TextStyle(fontSize: 30, color: Colors.grey),))
                    Container(
                        height: 240,
                        width: 240,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFFc2e59c), Color(0xFF64b3f4)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        )),
              ),
            ),
          );
        },
      ),
    );

    //   RotationTransition(
    //   alignment: Alignment.bottomLeft,
    //   turns: Tween(begin: 0.0 , end: 2.0).animate(controller.controller),
    //   child: Container(
    //     height: 250,
    //     width: 130,
    //     color: Colors.red,
    //   ),
    // );
  }
}
