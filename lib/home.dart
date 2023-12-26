import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/constants/text_constants.dart';
import 'package:rss_interactive_v2/controllers/main_controller.dart';
import 'package:rss_interactive_v2/pages/market_page.dart';
import 'package:rss_interactive_v2/pages/home_page.dart';
import 'package:rss_interactive_v2/pages/news_page.dart';
import 'package:rss_interactive_v2/pages/profile_page.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  MainController mainController = Get.put(MainController());
  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: TextConstants.appTitle,
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorConstants.rssDarkBlue,
            type: BottomNavigationBarType.fixed,
            currentIndex: mainController.bottomNavBarIndex.value,
            selectedItemColor: ColorConstants.white,
            unselectedItemColor: ColorConstants.unselectedItemColor,
            onTap: (value) {
              mainController.setIndex(value);
              switch (mainController.bottomNavBarIndex.value) {
                case 0:
                  currentScreen = const HomePage();
                  break;
                case 1:
                  currentScreen = NewsPage();
                  break;
                case 2:
                  currentScreen = MarketPage();
                  break;
                case 3:
                  currentScreen = const ProfilePage();
                  break;
                default:
              }
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "AnaSayfa"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper_rounded), label: "Haberler"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.insert_chart_outlined_rounded),
                  label: "Piyasalar"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box_rounded), label: "Profil"),
            ]),
        body: currentScreen));
  }
}
