import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/models/news_model.dart';
import 'package:rss_interactive_v2/pages/profile_page.dart';
import 'package:rss_interactive_v2/widgets/news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late final Future<List<NewsModel>> fillNewsList;

  @override
  void initState() {
    super.initState();
    fillNewsList = getNewsModel();
  }

  @override
  Widget build(BuildContext context) {
    return emailVerification
        ? FutureBuilder(
            future: fillNewsList,
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

  Future<List<NewsModel>> getNewsModel() async {
    try {
      final options = Options(headers: {
        "authorization": "apikey 4kB3Uc66TdSqjI1YM1bWDS:0jRhzdhMmS8gZtEnT9Ak2v",
      });

      final response = await Dio().get(
          "https://api.collectapi.com/news/getNews?country=tr&tag=general",
          options: options);

      List<NewsModel> newsList = [];

      if (response.statusCode == 200) {
        final newsData = response.data as Map<String, dynamic>;
        newsList = (newsData['result'] as List)
            .map((e) => NewsModel.fromJson(e))
            .toList();
      }
      return newsList;
    } on DioException catch (e) {
      return Future.error(e.message.toString());
    }
  }
}
