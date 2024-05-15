import 'package:flutter_application_1/welcome_page/welcome_page.controller.dart';
import 'package:get/get.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomePageController());
  }
}
