
import 'package:driver/home/controller/loginController.dart';
import 'package:driver/routes/app_routes.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/app_strings.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:driver/utils/inpuFieldDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  LoginController controller = Get.find();
  // List<String> nextRoute = Get.arguments;

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:AppColors.blueLight,
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    ImagePaths.logo,
                    height: 80,
                  ),
                  Center(
                    child: "Driver"
                        .text
                        .bold
                        .white
                        .size(25)
                        .align(TextAlign.center)
                        .make()
                        .py(8),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: "Login with Email ID/Mobile"
                            .text
                            .white
                            .align(TextAlign.left)
                            .size(14)
                            .make()),
                  ).wFourFifth(context).py(8),
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    constraints:
                        const BoxConstraints(maxHeight: 70, minHeight: 45),
                    child: TextFormField(
                      controller: controller.phoneEmailController,
                      focusNode: controller.mobileFn,
                      // inputFormatters: [
                      // FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      // ],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return controller.handleEmail();
                      },
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (String value) {
                        FocusScope.of(context).requestFocus(controller.passFn);
                      },
                      decoration: CustomeInputDecoration.formDecoration(
                          "eg - 9855*****4 ", "Email/Mobile"),
                    ).py8(),
                  ),
                  Obx(
                    () => Container(
                      width: MediaQuery.of(context).size.width * .8,
                      constraints:
                          const BoxConstraints(maxHeight: 70, minHeight: 45),
                      child: TextFormField(
                        controller: controller.passwordController,
                        focusNode: controller.passFn,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(' ')
                        ],
                        obscureText: controller.eye.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return controller.handlePassword();
                        },
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (String value) {},
                        decoration: InputDecoration(
                          suffixIcon: controller.eyeVisibility().onTap(() {
                            controller.eye.value = !controller.eye.value;
                          }),
                          isDense: true,
                          fillColor: Colors.white,
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "**********",
                          labelText: "Password",
                        ),
                      ),
                    ).py8(),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.orange,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                      onPressed: () {
                        if (controller.loginFetch.value) {
                          // controller.login(nextRoute[0]);
                        }
                      },
                      child: Obx(
                        () => controller.loginFetch.value
                            ? AppStrings.login.text.lg
                                .color(AppColors.white)
                                .bold
                                .make()
                            : Transform.scale(
                                scale: .5,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                )),
                      ),
                    ),
                  ).py8(),
                  InkWell(
                    onTap: () {
                      // controller.user = nextRoute[0];
                      // Get.toNamed(AppRoutes.forgotPassword);
                    },
                    child: Align(
                            alignment: Alignment.bottomRight,
                            child: AppStrings.forgotPassword.text.white
                                .align(TextAlign.left)
                                .size(14)
                                .underline
                                .make())
                        .wFourFifth(context)
                        .py(8),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     const DottedLine(
                  //       direction: Axis.horizontal,
                  //       lineLength: 100,
                  //       lineThickness: 1.0,
                  //       dashLength: 4.0,
                  //       dashColor: Colors.white,
                  //       dashRadius: 0.0,
                  //       dashGapLength: 4.0,
                  //       dashGapColor: Colors.transparent,
                  //       dashGapRadius: 0.0,
                  //     ),
                  //     "OR".text.white.make(),
                  //     const DottedLine(
                  //       direction: Axis.horizontal,
                  //       lineLength: 100,
                  //       lineThickness: 1.0,
                  //       dashLength: 4.0,
                  //       dashColor: Colors.white,
                  //       dashRadius: 0.0,
                  //       dashGapLength: 4.0,
                  //       dashGapColor: Colors.transparent,
                  //       dashGapRadius: 0.0,
                  //     ),
                  //   ],
                  // ).wFourFifth(context).py(8),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * .8,
                  //   height: 60,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         primary: AppColors.white,
                  //         elevation: 5,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(50),
                  //         )),
                  //     onPressed: () {},
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const Icon(
                  //           Icons.facebook,
                  //           size: 30,
                  //           color: AppColors.blueLight,
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         SizedBox(
                  //                 width: 160,
                  //                 child: AppStrings.facebook.text
                  //                     .size(16)
                  //                     .black
                  //                     .make())
                  //             .p12(),
                  //       ],
                  //     ),
                  //   ).py(10),
                  // ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * .8,
                  //   height: 60,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         primary: AppColors.white,
                  //         elevation: 5,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(50),
                  //         )),
                  //     onPressed: () {},
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Image.asset(
                  //           ImagePaths.google,
                  //           width: 25,
                  //           height: 25,
                  //           fit: BoxFit.fill,
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         SizedBox(
                  //                 width: 160,
                  //                 child: AppStrings.google.text
                  //                     .size(16)
                  //                     .black
                  //                     .make())
                  //             .p12(),
                  //       ],
                  //     ),
                  //   ).py(10),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     Get.toNamed(AppRoutes.signUP);
                  //   },
                  //   child: RichText(
                  //     text: TextSpan(
                  //       text: AppStrings.donthaveAccount,
                  //       style: TextStyle(fontSize: 13, color: Colors.white),
                  //       children: <TextSpan>[
                  //         TextSpan(
                  //             text: ' ${AppStrings.signUp}',
                  //             style: TextStyle(
                  //                 fontSize: 15,
                  //                 color: Colors.white.withOpacity(0.8))),
                  //       ],
                  //     ),
                  //   ).py(10),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
