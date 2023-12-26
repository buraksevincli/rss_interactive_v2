import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/text_constants.dart';
import 'package:rss_interactive_v2/models/application_model.dart';
import 'package:rss_interactive_v2/pages/all_apps_page.dart';
import 'package:rss_interactive_v2/pages/app_detail_page.dart';
import 'package:rss_interactive_v2/services/rest_api.dart';

class AllAppWidget extends StatefulWidget {
  const AllAppWidget({super.key});

  @override
  State<AllAppWidget> createState() => _AllAppWidgetState();
}

class _AllAppWidgetState extends State<AllAppWidget> {
  late Future<List<ApplicationModel>> fillList;

  @override
  void initState() {
    super.initState();
    fillList = readApplicationModelList(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fillList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var applicationList = snapshot.data!;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: Get.width,
            height: 210,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextConstants.allAppHomePage,
                    InkWell(
                      onTap: () {
                        Get.to(() =>
                            AllAppsPages(applicationList: applicationList));
                      },
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    height: 170,
                    width: Get.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: applicationList.length,
                      itemBuilder: (context, index) {
                        ApplicationModel currentModel = applicationList[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: listElement(currentModel.profileImage!,
                              currentModel.name!, currentModel),
                        );
                      },
                    ))
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

  Widget listElement(
      String image, String appName, ApplicationModel applicationModel) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => AppDetailPage(applicationModel: applicationModel));
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(image))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 80,
          child: Text(
            appName,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
      ],
    );
  }

  
}
