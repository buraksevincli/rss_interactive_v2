import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/constants/text_constants.dart';
import 'package:rss_interactive_v2/controllers/auth_controller.dart';

// ignore: must_be_immutable
class SignInPanel extends StatelessWidget {
  SignInPanel({super.key});

  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextConstants.appTitle,
          iconTheme: const IconThemeData(color: ColorConstants.white),
        ),
        backgroundColor: ColorConstants.rssDarkBlue,
        body: Obx(() => Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: Get.width,
                    height: 80,
                    child: const Text(
                      "Kayıt Ol",
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
                        authController.checkEmail(value);
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
                        authController.checkPassword(value);
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    height: 40,
                    child: Text(
                      authController.exception.value,
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
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        authController.checkSignIn(authController.auth);
                      },
                      child: const Text(
                        "Kayıt Ol",
                        style: TextStyle(
                            color: ColorConstants.white, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
