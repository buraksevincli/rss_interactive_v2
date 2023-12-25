import 'package:flutter/material.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';

class TextConstants {
  TextConstants._();

  static const Text rssTitle = Text("RSS Interactive",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white));
  static const Text appTitle = Text("RSS Store",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white));
  static const Text allAppTitle = Text("Tüm Uygulamalar",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white));
  static const Text subTitle = Text(
    "Son teknoloji finansal uygulamalar...",
    style: TextStyle(color: Colors.white60, fontSize: 14),
  );
  static const Text featureAppTitle = Text("Öne çıkan uygulama",
      style: TextStyle(color: Colors.white, fontSize: 16));
  static const Text allAppHomePage = Text(
    "Tüm uygulamalar",
    style: TextStyle(fontSize: 16, color: Colors.white),
  );
  static const Text appDevInfo = Text("Uygulama yazılımı bilgileri",
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: ColorConstants.white));
  static const Text aboutAppText = Text(
    "Bu uygulama hakkında",
    style: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: ColorConstants.white),
  );

  static Text setDetailPageText(String text) => Text(text,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: ColorConstants.white));

  static Image rssBanner = Image.asset("assets/images/rss_banner.jpeg");
  static AssetImage rssProfile =
      const AssetImage("assets/images/rss_profile.jpeg");

  
}
