import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/constants/text_constants.dart';
import 'package:rss_interactive_v2/models/application_model.dart';
import 'package:rss_interactive_v2/pages/app_detail_page.dart';

class AllAppsPages extends StatelessWidget {
  const AllAppsPages({
    Key? key,
    required this.applicationList,
  }) : super(key: key);
  final List<ApplicationModel> applicationList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextConstants.allAppTitle,
          backgroundColor: ColorConstants.rssDarkBlue,
          iconTheme: const IconThemeData(color: ColorConstants.white),
        ),
        body: Container(
          color: ColorConstants.rssBlue,
          child: ListView.builder(
            itemCount: applicationList.length,
            itemBuilder: (context, index) {
              var currentApp = applicationList[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: ColorConstants.rssDarkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: ListTile(
                  onTap: () {
                    Get.to(() => AppDetailPage(applicationModel: currentApp));
                  },
                  contentPadding: const EdgeInsets.all(8),
                  leading: Container(
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: AssetImage(currentApp.profileImage!),
                            fit: BoxFit.fill)),
                  ),
                  title: Text(
                    currentApp.name!,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  subtitle: Text(
                    "${currentApp.stars}  |  ${currentApp.downloads} İndirme |  ${currentApp.comments} Yorum",
                    style: const TextStyle(color: Colors.white60, fontSize: 14),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              );
            },
          ),
        ));
  }
}
