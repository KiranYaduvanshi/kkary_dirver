import 'package:driver/modules/views/home.dart';
import 'package:driver/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const homeRoute = AppRoutes.home;

  static final routes = [

    GetPage(
      name: AppRoutes.home,
      page: () => const Home(),
    ),
  ];
}
