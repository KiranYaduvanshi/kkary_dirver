import 'package:driver/authentication/views/driver/driver_step_one.dart';
import 'package:driver/authentication/views/driver/driver_step_third.dart';
import 'package:driver/authentication/views/driver/driver_step_two.dart';
import 'package:driver/authentication/views/driver/review_documnets.dart';
import 'package:driver/home/binding/driver_details_binding.dart';
import 'package:driver/home/binding/history_binding.dart';
import 'package:driver/home/binding/home_driver_binding.dart';
import 'package:driver/home/binding/loginBinding.dart';
import 'package:driver/home/binding/notification_bindings.dart';
import 'package:driver/home/screens/add_bank_account.dart';
import 'package:driver/home/screens/driver_details.dart';
import 'package:driver/home/screens/driver_home.dart';
import 'package:driver/home/screens/driver_requirments.dart';
import 'package:driver/home/screens/earing_page.dart';
import 'package:driver/home/screens/history.dart';
import 'package:driver/home/screens/home_page.dart';
import 'package:driver/home/screens/loginScreen.dart';
import 'package:driver/home/screens/notification.dart';
import 'package:driver/home/screens/rating.dart';
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
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
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
    GetPage(
      name: AppRoutes.driverStepTwo,
      page: () => DriverStepTwo(),
    ),
    GetPage(
      name: AppRoutes.driverStepThird,
      page: () => DriverStepThird(),
    ),
    GetPage(
      name: AppRoutes.driverReview,
      page: () => ReviewDocument(),
    ),
    GetPage(
      name: AppRoutes.rideDetail,
      page: () => DriverDetails(),
      binding: DriverDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => History(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: AppRoutes.rating,
      page: () => Rating(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () =>const NotificationScreen(),
      binding: NotificationBinding()
    ),
  ];
}
