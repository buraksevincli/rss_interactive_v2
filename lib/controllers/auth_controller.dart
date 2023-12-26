import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/pages/profile_page.dart';

class AuthController extends GetxController {
  late FirebaseAuth auth;

  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;

    auth.authStateChanges().listen((user) {
      if (user == null) {
        loggedIn = false;
        emailVerification = false;
      } else {
        loggedIn = true;
        if (user.emailVerified) {
          emailVerification = true;
        }
      }
    });
  }
}
