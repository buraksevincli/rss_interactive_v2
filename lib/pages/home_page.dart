import 'package:flutter/material.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/constants/text_constants.dart';
import 'package:rss_interactive_v2/widgets/all_apps.dart';
import 'package:rss_interactive_v2/widgets/featured_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.rssBlue,
      child: ListView(
        children: [
          Container(
            child: TextConstants.rssBanner,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: TextConstants.rssTitle),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: TextConstants.subTitle)
                    ],
                  ),
                ),
              ),
              Container(
                height: 90,
                width: 90,
                padding: const EdgeInsets.all(15),
                child: Container(
                    decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: TextConstants.rssProfile,
                    fit: BoxFit.fill,
                  ),
                )),
              )
            ],
          ),
          FeaturedAppWidget(),
          AllAppWidget(),
        ],
      ),
    );
  }
}
