import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/constants/text_constants.dart';
import 'package:rss_interactive_v2/pages/market_page.dart';
import 'package:rss_interactive_v2/pages/home_page.dart';
import 'package:rss_interactive_v2/pages/news_page.dart';
import 'package:rss_interactive_v2/pages/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late FirebaseAuth auth;
  int currentIndex = 0;
  Widget currentScreen = const HomePage();

  @override
  void initState() {
    super.initState();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextConstants.appTitle,
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorConstants.rssDarkBlue,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            selectedItemColor: ColorConstants.white,
            unselectedItemColor: ColorConstants.unselectedItemColor,
            onTap: (value) {
              setState(() {
                currentIndex = value;
                switch (currentIndex) {
                  case 0:
                    currentScreen = const HomePage();
                    break;
                  case 1:
                    currentScreen = const NewsPage();
                    break;
                  case 2:
                    currentScreen = const MarketPage();
                    break;
                  case 3:
                    currentScreen = const ProfilePage();
                    break;
                  default:
                }
              });
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
        body: currentScreen);
  }
}
