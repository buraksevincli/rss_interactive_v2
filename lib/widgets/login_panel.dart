import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/services/firebase_auth.dart';
import 'package:rss_interactive_v2/widgets/sign_in_panel.dart';

class LogInPanel extends StatefulWidget {
  const LogInPanel({super.key});

  @override
  State<LogInPanel> createState() => _LogInPanelState();
}

class _LogInPanelState extends State<LogInPanel> {
  late FirebaseAuth auth;
  String email = "";
  String password = "";
  String exception = "";

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: Get.width,
            height: 80,
            child: const Text(
              "Giriş Yap",
              style: TextStyle(
                  color: ColorConstants.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: Get.width,
            height: 60,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  if (value.contains("@") && value.contains(".com")) {
                    email = value;
                    exception = "";
                  } else {
                    exception = "Geçersiz email!";
                  }
                });
              },
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIconColor: Colors.amber,
                  labelText: "E-posta",
                  labelStyle: const TextStyle(
                      color: ColorConstants.unselectedItemColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: ColorConstants.rssBlue),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: Get.width,
            height: 60,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    password = value;
                    exception = "";
                  } else {
                    exception = "Geçersiz şifre!";
                  }
                });
              },
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(color: ColorConstants.white),
              decoration: InputDecoration(
                  labelText: "Şifre",
                  labelStyle: const TextStyle(
                      color: ColorConstants.unselectedItemColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: ColorConstants.rssBlue),
              obscureText: true,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            width: Get.width,
            height: 40,
            child: Text(
              exception,
              style: const TextStyle(color: ColorConstants.white),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 60,
            width: Get.width,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => ColorConstants.rssYellow),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                setState(() {
                  if (email.isNotEmpty && password.isNotEmpty) {
                    logInUserEmailAndPassword(auth, email, password, exception);
                  }
                });
              },
              child: const Text(
                "Giriş Yap",
                style: TextStyle(color: ColorConstants.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60,
            width: Get.width,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => ColorConstants.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                signInWithGoogle();
              },
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/g.png")),
                  Container(
                    width: Get.width / 2,
                    alignment: Alignment.centerRight,
                    child: const Text(
                      "Google ile Devam Et",
                      style: TextStyle(
                          color: ColorConstants.rssDarkBlue, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Henüz hesabınız yok mu?",
                  style: TextStyle(fontSize: 16, color: ColorConstants.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const SignInPanel());
                  },
                  child: const Text(
                    "Kayıt Ol",
                    style: TextStyle(
                        color: ColorConstants.rssYellow, fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
