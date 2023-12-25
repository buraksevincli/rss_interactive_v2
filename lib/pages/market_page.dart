import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/models/coin_model.dart';
import 'package:rss_interactive_v2/pages/profile_page.dart';
import 'package:rss_interactive_v2/widgets/coin_card.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  late final Future<List<CoinModel>> fillCoinList;

  @override
  void initState() {
    super.initState();
    fillCoinList = getCoinList();
  }

  @override
  Widget build(BuildContext context) {
    return emailVerification
        ? FutureBuilder(
            future: fillCoinList,
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

  Future<List<CoinModel>> getCoinList() async {
    try {
      var response = await Dio().get(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=tr",
      );

      List<CoinModel> coinList = [];
      if (response.statusCode == 200) {
        coinList =
            (response.data as List).map((e) => CoinModel.fromJson(e)).toList();
      }
      return coinList;
    } on DioException catch (e) {
      return Future.error(e.message.toString());
    }
  }
}
