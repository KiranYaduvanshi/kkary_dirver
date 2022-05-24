import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AcceptAndGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Widget items(Color color, String ttitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: color,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade100, blurRadius: 3),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          ttitle.text.make(),
        ],
      ),
    );
  }
}
