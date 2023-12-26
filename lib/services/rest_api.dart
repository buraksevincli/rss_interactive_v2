import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rss_interactive_v2/models/application_model.dart';
import 'package:rss_interactive_v2/models/coin_model.dart';
import 'package:rss_interactive_v2/models/news_model.dart';

Future<List<ApplicationModel>> readApplicationModelList(BuildContext context) async {
    try {
      String readingString = await DefaultAssetBundle.of(context)
          .loadString("assets/datas/applications.json");

      var jsonObJect = jsonDecode(readingString);

      List<ApplicationModel> applicationModel = (jsonObJect as List)
          .map((applicationMap) => ApplicationModel.fromJson(applicationMap))
          .toList();

      return applicationModel;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<CoinModel>> getCoinModelList() async {
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

  Future<List<NewsModel>> getNewsModelList() async {
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