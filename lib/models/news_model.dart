// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

import 'dart:convert';

NewsModel currencyModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String currencyModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    String? key;
    String? url;
    String? description;
    String? image;
    String? name;
    String? source;

    NewsModel({
        this.key,
        this.url,
        this.description,
        this.image,
        this.name,
        this.source,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        key: json["key"],
        url: json["url"],
        description: json["description"],
        image: json["image"],
        name: json["name"],
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "url": url,
        "description": description,
        "image": image,
        "name": name,
        "source": source,
    };
}
