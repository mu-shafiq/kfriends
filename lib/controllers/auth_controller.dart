import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController country = TextEditingController();

  RxBool male = true.obs;
  RxBool terms = true.obs;
  RxBool privacy = false.obs;

  RxString selectedJob = ''.obs;

  void updateJob(String job) {
    selectedJob.value = job;
    update();
  }

  void updateGender(bool gender) {
    male.value = gender;
    update();
  }

  Future<void> signUp(String email, String password) async {}
}
