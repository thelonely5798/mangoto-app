



import 'package:get/instance_manager.dart';
import 'package:mangoto/src/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}