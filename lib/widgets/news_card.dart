import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final NewsModel currentNews;
  const NewsCard({super.key, required this.currentNews});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 180,
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          final uri = Uri.parse(currentNews.url!);
          launchUrl(uri, mode: LaunchMode.inAppBrowserView);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.rssBlue),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(currentNews.image!),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: 255,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentNews.name!,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.white)
                    ),
                    Text(
                      currentNews.source!,
                      style:
                          const TextStyle(color: ColorConstants.unselectedItemColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
