import 'dart:convert';

import 'package:toktik/domain/entities/video_post.dart';

LocalVideoModel videoPostFromJson(String str) => LocalVideoModel.fromJson(json.decode(str));
String videoPostToJson(LocalVideoModel data) => json.encode(data.toJson());

class LocalVideoModel {
  //Its a Mapper Class

    String name;
    String videoUrl;
    int likes;
    int views;

    LocalVideoModel({
        required this.name,
        required this.videoUrl,
        this.likes=0,
        this.views=0,
    });

    factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
        name: json["name"] ?? 'No name specified',
        videoUrl: json["videoUrl"],
        likes: json["likes"] ?? 0,
        views: json["views"] ?? 0,
    );


    VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videoUrl: videoUrl,
        likes: likes,
        views: views
      );
    

    Map<String, dynamic> toJson() => {
        "name": name,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": views,
    };
}
