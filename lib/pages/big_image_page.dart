import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';

class BigImagePage extends StatelessWidget {
  const BigImagePage({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorConstants.white),
      ),
      body: Container(
        color: ColorConstants.rssBlue,
        width: Get.width,
        height: Get.height,
        child: Image.network(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
