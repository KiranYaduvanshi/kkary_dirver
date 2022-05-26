import 'package:driver/utils/app_colors.dart';
import 'package:driver/utils/image_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.blueLight,
        leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 2)],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: BackButton(
            color: Colors.black,
          ),
        ).px(8).py(8),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .4 +MediaQuery.of(context).size.width * .15,
                color: AppColors.blueLight,
                width: double.infinity,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      "Thank You"
                          .text
                          .size(17)
                          .semiBold
                          .white
                          .bold
                          .make()
                          .py8(),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        backgroundImage: AssetImage(
                          ImagePaths.user,
                        ),
                      ).py(16),
                      VxRating(
                          maxRating: 5.0,
                          count: 5,
                          size: 30,
                          value: 0,
                          normalColor: Colors.white,
                          selectionColor: AppColors.yellowGold,
                          onRatingUpdate: (String value) {})
                          .py(10),
                      Column(
                        children: [
                          "We are glad you are liked the trip!"
                              .text
                              .white
                              .semiBold
                              .make(),
                          "Any Comments ?".text.semiBold.white.make(),

                        ],

                      ).py(4),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset:
                Offset(0, -MediaQuery.of(context).size.width * .13),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  // margin: EdgeInsets.only(top: 10, bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.width * .3,
                      maxHeight: MediaQuery.of(context).size.width * .4),
                  height: MediaQuery.of(context).size.width * .3,
                  child: TextField(
                    cursorWidth: 2.0,
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: "Type your message here",
                      hintStyle: TextStyle(
                        fontSize: 13,
                      ),
                      hintMaxLines: 1,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ).py(8),
                ).px(12),
              ),
            ],
          ).expand(),
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            width: MediaQuery.of(context).size.width * 1,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.blueLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: "Done"
                    .text
                    .white
                    .bold
                    .align(TextAlign.center)
                    .make()
                    .wFourFifth(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
