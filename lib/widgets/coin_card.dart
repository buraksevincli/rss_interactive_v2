import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_interactive_v2/constants/color_constants.dart';
import 'package:rss_interactive_v2/models/coin_model.dart';

class CoinCard extends StatelessWidget {
  final CoinModel coinModel;
  const CoinCard({super.key, required this.coinModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: Get.width,
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Container(
                padding: const EdgeInsets.all(15),
                child: Image.network(coinModel.image!)),
          ),
          SizedBox(
            width: (Get.width * 3) / 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Get.width/4,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${coinModel.symbol!.toUpperCase()}/USDT",
                          style: const TextStyle(
                              color: ColorConstants.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: Get.width / 4,
                        child: Text(coinModel.name!,
                            style: const TextStyle(
                                color: ColorConstants.unselectedItemColor,
                                fontSize: 13)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: Get.width / 5,
                    alignment: Alignment.center,
                    child: Text(
                      coinModel.currentPrice.toStringAsFixed(2),
                      style: const TextStyle(
                          color: ColorConstants.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: Get.width / 5,
                    child: Container(
                      height: 40,
                      width: 75,
                      decoration: BoxDecoration(
                          color: coinModel.priceChangePercentage24H >= 0
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text(
                          "% ${coinModel.priceChangePercentage24H.toStringAsFixed(2)}"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
