import 'package:driver/home/controller/profile_screen_controller.dart';
import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreenContoller contoller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.blueLight,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: " My Profile   ".text.size(18).make(),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ).px(12)
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: contoller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 24),
                      width: 80.0,
                      height: 80.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 30,
                        backgroundImage: AssetImage(ImagePaths.user),
                      ),
                    ).py(12),
                    InkWell(
                      onTap: () {},
                      child: "Change Profile "
                          .text
                          .color(AppColors.blueLight)
                          .bold
                          .make()
                          .px(10),
                    )
                  ],
                ).py20(),
                TextFormField(
                  initialValue: "name",
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9  ]')),
                  ],
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: AppColors.blueLight),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: 'Name',
                    labelText: 'Full Name',
                  ),
                  validator: (value) {},
                ).px(24),
                const Divider(
                  color: Colors.grey,
                ).px(24),
                TextFormField(
                  initialValue: "bio",
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: AppColors.blueLight),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: 'Add bio here',
                    labelText: 'Bio',
                  ),
                  validator: (value) {},
                ).px(24),
                const Divider(
                  color: Colors.grey,
                ).px(24),
                TextFormField(
                  initialValue: "address",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {},
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: AppColors.blueLight),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: 'Add Address',
                    labelText: 'Address',
                  ),
                ).px(24),
                const Divider(
                  color: Colors.grey,
                ).px(24),
                TextFormField(
                  style: TextStyle(color: Colors.grey[600]),
                  //  readOnly: isEmailEmpty,
                  initialValue: "email",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {},
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: AppColors.blueLight),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: 'Enter Email',
                    labelText: 'Email',
                  ),
                ).px(24),
                const Divider(
                  color: Colors.grey,
                ).px(24),
                TextFormField(
                  style: TextStyle(color: Colors.grey[600]),
                  //readOnly: isPhoneEmpty,
                  initialValue: "phone number",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {},
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: AppColors.blueLight),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: 'Add Phone Number',
                    labelText: 'Phone',
                  ),
                ).px(24),
                const Divider(
                  color: Colors.grey,
                ).px(24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
