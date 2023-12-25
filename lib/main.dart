import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/firebase_options.dart';
import 'package:rss_interactive_v2/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Binding'i başlatın
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RSS Store',
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(backgroundColor: ColorConstants.rssDarkBlue)),
      home: const Home(),
    );
  }
}
