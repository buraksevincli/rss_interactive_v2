import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/services/firebase_auth.dart';

class AuthController extends GetxController {
  late FirebaseAuth auth;
  RxBool loggedIn = false.obs;
  RxBool emailVerification = false.obs;
  RxString email = "".obs;
  RxString exception = "".obs;
  RxString password = "".obs;

  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;

    checkLogInAndLogOut();
  }

  checkLogInAndLogOut() {
    auth.authStateChanges().listen((user) {
      if (user == null) {
        loggedIn.value = false;
        emailVerification.value = false;
      } else {
        loggedIn.value = true;
        if (user.emailVerified) {
          emailVerification.value = user.emailVerified;
        }
      }
    });
  }

  checkEmail(String value) {
    if (value.contains("@") && value.contains(".com")) {
      email.value = value;
      exception.value = "";
    } else {
      exception.value = "Geçersiz email!";
    }
  }

  checkPassword(String value) {
    if (value.length >= 6) {
      password.value = value;
      exception.value = "";
    } else {
      exception.value = "Şifre en az 6 karakter olmalı!";
    }
  }

  checkSignIn(FirebaseAuth auth) {
    if (email.value.isNotEmpty &&
        password.value.isNotEmpty &&
        exception.value.isEmpty) {
      signInUserEmailAndPassword(
          auth, email.value, password.value, exception.value);
      Get.back();
    }
  }

  checkLogIn(FirebaseAuth auth) {
    if (email.value.isNotEmpty &&
        password.value.isNotEmpty &&
        exception.value.isEmpty) {
      logInUserEmailAndPassword(
          auth, email.value, password.value, exception.value);
    }
  }
}
