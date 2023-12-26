import 'package:get/get.dart';
import 'package:rss_interactive_v2/models/coin_model.dart';
import 'package:rss_interactive_v2/models/news_model.dart';
import 'package:rss_interactive_v2/services/rest_api.dart';

class ModelController extends GetxController {
  late final Future<List<NewsModel>> fillNewsList;
  late final Future<List<CoinModel>> fillCoinList;

  @override
  void onInit() {
    super.onInit();
    fillNewsList = getNewsModelList();
    fillCoinList = getCoinModelList();
  }
}
