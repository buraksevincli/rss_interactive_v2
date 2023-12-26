import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/constants/text_constants.dart';
import 'package:rss_interactive_v2/models/application_model.dart';
import 'package:rss_interactive_v2/widgets/app_images_listview.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDetailPage extends StatelessWidget {
  const AppDetailPage({super.key, required this.applicationModel});
  final ApplicationModel applicationModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.rssBlue,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: ColorConstants.white),
            backgroundColor: ColorConstants.rssDarkBlue,
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: TextConstants.setDetailPageText(applicationModel.name!),
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 15),
              background: Image.asset(
                applicationModel.bannerImage!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  width: Get.width,
                  height: 120,
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(applicationModel.profileImage!),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: 35,
                            width: Get.width / 1.5,
                            child: Text(
                                "${applicationModel.stars} | ${applicationModel.downloads} İndirme | ${applicationModel.comments} Yorum",
                                style: const TextStyle(
                                    fontSize: 16, color: ColorConstants.white)),
                          ),
                          Row(
                            children: [
                              TextButton.icon(
                                icon: const Icon(
                                  Icons.play_arrow_rounded,
                                  color: ColorConstants.white,
                                ),
                                label: const Text(
                                  "Play Store",
                                  style: TextStyle(color: ColorConstants.white),
                                ),
                                onPressed: () {
                                  final url = Uri.parse(
                                      applicationModel.playStore!.toString());
                                  launchUrl(url,
                                      mode: LaunchMode.inAppBrowserView);
                                },
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              TextButton.icon(
                                icon: const Icon(
                                  Icons.apple_rounded,
                                  color: ColorConstants.white,
                                ),
                                label: const Text(
                                  "App Store",
                                  style: TextStyle(color: ColorConstants.white),
                                ),
                                onPressed: () {
                                  final appStoreUrl = Uri.parse(
                                      applicationModel.appStore!.toString());
                                  launchUrl(appStoreUrl,
                                      mode: LaunchMode.inAppBrowserView);
                                },
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                  thickness: .5,
                  color: ColorConstants.white,
                  endIndent: 10,
                  indent: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: TextConstants.aboutAppText,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: Get.width,
                  child: Text(
                    applicationModel.info!,
                    style:
                        const TextStyle(fontSize: 16, color: ColorConstants.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: Get.width,
                  height: 250,
                  child: AppImagesListView(
                      sizedBoxWidth: 10,
                      height: 100,
                      width: 120,
                      applicationModel: applicationModel),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(16),
                  child: TextConstants.appDevInfo,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: Get.width,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appSoftwareInfo("Sürüm:"),
                          appSoftwareInfo("Güncelleme tarihi:"),
                          appSoftwareInfo("İndirme sayısı:"),
                          appSoftwareInfo("Gerekli işletim sistemi:"),
                          appSoftwareInfo("Sunan:"),
                          appSoftwareInfo("Çıkış tarihi:"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          appSoftwareInfo(applicationModel.version!),
                          appSoftwareInfo(applicationModel.updateDate!),
                          appSoftwareInfo(applicationModel.downloads!),
                          appSoftwareInfo(applicationModel.requiredVersion!),
                          appSoftwareInfo(applicationModel.company!),
                          appSoftwareInfo(applicationModel.releasedDate!),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Text appSoftwareInfo(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: ColorConstants.white, fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}
