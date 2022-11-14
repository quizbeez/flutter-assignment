import 'package:flutter_home_assignment/src/features/quizz/controllers/quizz_controller.dart';
import 'package:get/get.dart';

class QuizzBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizzController());
  }
}
