

import 'package:pelis_app/domain/entities/video_post.dart';

class LocalVideModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideModel({required this.name, required this.videoUrl, this.likes = 0, this.views = 0});

  factory LocalVideModel.getJsonParse(Map<String, dynamic> json) => 
  LocalVideModel(
    name: json['name'],
    videoUrl: json['videoUrl'],
    likes: json['likes'],
    views: json['views'],
  );

  VideoPostEntity getVideoPostfinal () {
    return VideoPostEntity(caption: name, videoUrl: videoUrl, likes: likes, views: views);
  }
}