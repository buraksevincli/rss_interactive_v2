import 'dart:convert';

ApplicationModel applicationModelFromJson(String str) => ApplicationModel.fromJson(json.decode(str));

String applicationModelToJson(ApplicationModel data) => json.encode(data.toJson());

class ApplicationModel {
    String? name;
    String? type;
    String? stars;
    String? comments;
    String? downloads;
    String? version;
    String? updateDate;
    String? releasedDate;
    String? requiredVersion;
    String? company;
    String? profileImage;
    String? bannerImage;
    AppPageImages? appPageImages;
    String? appStore;
    String? playStore;
    String? info;

    ApplicationModel({
        this.name,
        this.type,
        this.stars,
        this.comments,
        this.downloads,
        this.version,
        this.updateDate,
        this.releasedDate,
        this.requiredVersion,
        this.company,
        this.profileImage,
        this.bannerImage,
        this.appPageImages,
        this.appStore,
        this.playStore,
        this.info,
    });

    factory ApplicationModel.fromJson(Map<String, dynamic> json) => ApplicationModel(
        name: json["name"],
        type: json["type"],
        stars: json["stars"],
        comments: json["comments"],
        downloads: json["downloads"],
        version: json["version"],
        updateDate: json["update_date"],
        releasedDate: json["released_date"],
        requiredVersion: json["required_version"],
        company: json["company"],
        profileImage: json["profile_image"],
        bannerImage: json["banner_image"],
        appPageImages: json["app_page_images"] == null ? null : AppPageImages.fromJson(json["app_page_images"]),
        appStore: json["appStore"],
        playStore: json["playStore"],
        info: json["info"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "stars": stars,
        "comments": comments,
        "downloads": downloads,
        "version": version,
        "update_date": updateDate,
        "released_date": releasedDate,
        "required_version": requiredVersion,
        "company": company,
        "profile_image": profileImage,
        "banner_image": bannerImage,
        "app_page_images": appPageImages?.toJson(),
        "appStore": appStore,
        "playStore": playStore,
        "info": info,
    };
}

class AppPageImages {
    String? image1;
    String? image2;
    String? image3;
    String? image4;
    String? image5;
    String? image6;
    String? image7;
    String? image8;

    AppPageImages({
        this.image1,
        this.image2,
        this.image3,
        this.image4,
        this.image5,
        this.image6,
        this.image7,
        this.image8,
    });

    factory AppPageImages.fromJson(Map<String, dynamic> json) => AppPageImages(
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
        image6: json["image6"],
        image7: json["image7"],
        image8: json["image8"],
    );

    Map<String, dynamic> toJson() => {
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "image6": image6,
        "image7": image7,
        "image8": image8,
    };
}
