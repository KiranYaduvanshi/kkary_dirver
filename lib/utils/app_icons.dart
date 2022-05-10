import 'package:driver/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static const Icon searchIcon = Icon(
    Icons.search,
    color: AppColors.grayDark,
  );

  static const Icon dropDownIcon = Icon(
    Icons.arrow_drop_down,
    color: Colors.black,
    size: 28,
  );
  static const Icon dropUpIcon = Icon(
    Icons.arrow_drop_up_outlined,
    color: Colors.black,
  );
  static const Icon notification = Icon(
    Icons.notifications_none_sharp,
    color: Colors.white,
  );

  static Icon visibility = const Icon(Icons.visibility, color: Colors.grey);
  static Icon visibilityOff =
      const Icon(Icons.visibility_off, color: Colors.grey);
}
