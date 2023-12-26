import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/controllers/model_controller.dart';
import 'package:rss_interactive_v2/models/news_model.dart';
import 'package:rss_interactive_v2/pages/profile_page.dart';
import 'package:rss_interactive_v2/widgets/news_card.dart';

// ignore: must_be_immutable
class NewsPage extends StatelessWidget {
  NewsPage({super.key});

  ModelController modelController = Get.find();

  @override
  Widget build(BuildContext context) {
    return emailVerification
        ? FutureBuilder(
            future: modelController.fillNewsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<NewsModel> newsList = snapshot.data!;
                return Container(
                  color: ColorConstants.rssDarkBlue,
                  child: ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      NewsModel currentNews = newsList[index];
                      return NewsCard(currentNews: currentNews);
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Container(
                  color: ColorConstants.rssBlue,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: ColorConstants.white,
                  )),
                );
              }
            },
          )
        : Container(
            color: ColorConstants.rssBlue,
            alignment: Alignment.center,
            width: Get.width,
            height: Get.height,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_rounded,
                  size: 100,
                  color: ColorConstants.rssYellow,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Haber bültenine erişmek için lütfen giriş yapınız.",
                  style: TextStyle(color: ColorConstants.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
  }
}
