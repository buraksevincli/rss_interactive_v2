import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/controllers/model_controller.dart';
import 'package:rss_interactive_v2/models/coin_model.dart';
import 'package:rss_interactive_v2/pages/profile_page.dart';
import 'package:rss_interactive_v2/widgets/coin_card.dart';

// ignore: must_be_immutable
class MarketPage extends StatelessWidget {
  MarketPage({super.key});

  ModelController modelController = Get.find();

  @override
  Widget build(BuildContext context) {
    return emailVerification
        ? FutureBuilder(
            future: modelController.fillCoinList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CoinModel> coinList = snapshot.data!;
                return Container(
                  color: ColorConstants.rssBlue,
                  child: ListView.builder(
                    itemCount: coinList.length,
                    itemBuilder: (context, index) {
                      CoinModel currentCoin = coinList[index];
                      return CoinCard(coinModel: currentCoin);
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    height: Get.height,
                    color: ColorConstants.rssBlue,
                    child: const Text(
                      "API Error",
                      style:
                          TextStyle(color: ColorConstants.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
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
                  "Piyasalara erişmek için lütfen giriş yapınız.",
                  style: TextStyle(color: ColorConstants.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
  }
}
