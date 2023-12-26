import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late FirebaseAuth auth;
  RxBool loggedIn = false.obs;
  RxBool emailVerification = false.obs;

  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;

    auth.authStateChanges().listen((user) {
      if (user == null) {
        loggedIn.value = false;
        emailVerification.value = false;
      } else {
        loggedIn.value = true;
        if (user.emailVerified) {
          emailVerification.value = true;
        }
      }
    });
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
}
