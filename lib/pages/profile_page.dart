import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/controllers/auth_controller.dart';
import 'package:rss_interactive_v2/widgets/login_panel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

bool loggedIn = false;
bool emailVerification = false;

class _ProfilePageState extends State<ProfilePage> {
  AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();
    authController.auth.authStateChanges().listen((user) {
      if (mounted) {
        if (user == null) {
          setState(() {
            loggedIn = false;
            emailVerification = false;
          });
        } else {
          setState(() {
            loggedIn = true;
            if (user.emailVerified) {
              emailVerification = user.emailVerified;
            }
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.rssDarkBlue, body: checkState());
  }

  Widget checkState() {
    if (loggedIn && emailVerification) {
      return Container(
          padding: const EdgeInsets.all(20),
          width: Get.width,
          color: ColorConstants.rssBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: 120,
                    height: 120,
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/user_profile.jpeg"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    authController.auth.currentUser!.email.toString(),
                    style: const TextStyle(
                        color: ColorConstants.white, fontSize: 16),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: Get.width,
                child: TextButton(
                  onPressed: () {
                    authController.auth.signOut();
                  },
                  child: const Text(
                    "Çıkış",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ));
    } else if (loggedIn && !emailVerification) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.rssBlue),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lütfen, \n\n\"${authController.auth.currentUser!.email}\" adresine gelen aktivasyon koduna tıklayın ve tekrar giriş yapın.",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstants.rssYellow),
                child: TextButton(
                    onPressed: () {
                      authController.auth.signOut();
                    },
                    child: const Text(
                      "Anladım",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
      );
    } else {
      return LogInPanel();
    }
  }
}
