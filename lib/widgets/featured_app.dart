import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/text_constants.dart';
import 'package:rss_interactive_v2/controllers/model_controller.dart';
import 'package:rss_interactive_v2/pages/app_detail_page.dart';
import 'package:rss_interactive_v2/widgets/app_images_listview.dart';

// ignore: must_be_immutable
class FeaturedAppWidget extends StatelessWidget {
  FeaturedAppWidget({super.key});

  ModelController modelController = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: modelController.getModelList(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var featuredAppModel = snapshot.data![2];
          return Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: TextConstants.featureAppTitle),
                Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  height: 190,
                  width: Get.width,
                  child: AppImagesListView(
                    sizedBoxWidth: 10,
                    width: 100,
                    height: 120,
                    applicationModel: featuredAppModel,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Card(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: ListTile(
                      onTap: () {
                        Get.to(() =>
                            AppDetailPage(applicationModel: featuredAppModel));
                      },
                      contentPadding: const EdgeInsets.all(5),
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(featuredAppModel.profileImage!)),
                      title: Text(
                        featuredAppModel.name!,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      subtitle: Text(
                        "${featuredAppModel.type}  |  ${featuredAppModel.stars}  |  ${featuredAppModel.downloads} İndirme",
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 14),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("Veri Okunamadı"),
          );
        }
      },
    );
  }
}
