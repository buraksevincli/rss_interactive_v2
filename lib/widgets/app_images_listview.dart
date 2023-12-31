import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rss_interactive_v2/models/application_model.dart';
import 'package:rss_interactive_v2/pages/big_image_page.dart';

class AppImagesListView extends StatelessWidget {
  final ApplicationModel applicationModel;
  final double width;
  final double height;
  final double sizedBoxWidth;

  const AppImagesListView({
    Key? key,
    required this.applicationModel,
    required this.width,
    required this.height,
    required this.sizedBoxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: [
      listElement(applicationModel.appPageImages!.image1!),
      SizedBox(
        width: sizedBoxWidth,
      ),
      listElement(applicationModel.appPageImages!.image2!),
      SizedBox(
        width: sizedBoxWidth,
      ),
      listElement(applicationModel.appPageImages!.image3!),
      SizedBox(
        width: sizedBoxWidth,
      ),
      listElement(applicationModel.appPageImages!.image4!),
      SizedBox(
        width: sizedBoxWidth,
      ),
      listElement(applicationModel.appPageImages!.image5!),
      SizedBox(
        width: sizedBoxWidth,
      ),
      listElement(applicationModel.appPageImages!.image6!),
      SizedBox(
        width: sizedBoxWidth,
      ),
      listElement(applicationModel.appPageImages!.image7!),
      SizedBox(
        width: sizedBoxWidth,
      ),
      listElement(applicationModel.appPageImages!.image8!)
    ]);
  }

  listElement(String image) {
    return InkWell(
      onTap: () {
        Get.to(() => BigImagePage(image: image));
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(fit: BoxFit.fill, image: NetworkImage(image))),
      ),
    );
  }
}
