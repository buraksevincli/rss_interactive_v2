import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/controllers/auth_controller.dart';
import 'package:rss_interactive_v2/controllers/model_controller.dart';
import 'package:rss_interactive_v2/models/coin_model.dart';
import 'package:rss_interactive_v2/widgets/coin_card.dart';

// ignore: must_be_immutable
class MarketPage extends StatelessWidget {
  MarketPage({super.key});

  ModelController modelController = Get.find();
  AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return controller.emailVerification.value
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.warning_rounded,
                  size: 70,
                  color: ColorConstants.rssYellow,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    "Piyasalara erişmek için lütfen giriş yapınız.",
                    style: TextStyle(color: ColorConstants.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
  }
}
