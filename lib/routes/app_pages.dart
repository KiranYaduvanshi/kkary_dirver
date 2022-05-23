import 'package:driver/authentication/views/driver/driver_step_one.dart';
import 'package:driver/home/binding/home_driver_binding.dart';
import 'package:driver/home/screens/add_bank_account.dart';
import 'package:driver/home/screens/driver_home.dart';
import 'package:driver/home/screens/driver_requirments.dart';
import 'package:driver/home/screens/earing_page.dart';
import 'package:driver/home/screens/home_page.dart';
import 'package:driver/modules/views/home.dart';
import 'package:driver/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const homeRoute = AppRoutes.homeDriver;

  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
    ),
        GetPage(
      name: AppRoutes.homeDriver,
      page: () => DriverHome(),
          binding: HomeDriverBinding(),
    ),
    GetPage(
      name: AppRoutes.driverStepOne,
      page: () => DriverStepOne(),
    ),
    GetPage(
      name: AppRoutes.driverRequiments,
      page: () => DriverRequirments(),
    ),
    GetPage(
      name: AppRoutes.addBankAccount,
      page: () => AddBankAccount(),
    ),
    GetPage(
      name: AppRoutes.earing,
      page: () => EarningPage(),
    ),
  ];
}
