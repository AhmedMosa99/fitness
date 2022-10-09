import 'package:fitness/moduls/home/controller/home_controller.dart';
import 'package:get/get.dart';

import '../moduls/main/controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
  }
}
