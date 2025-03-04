import 'package:flutter/material.dart';
import 'package:pelis_app/domain/entities/video_post.dart';
import 'package:pelis_app/infrastructure/models/local_vide_model.dart';
import 'package:pelis_app/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {

  bool initialLoading = true;
  List <VideoPostEntity> videos = [];


  Future<void> loadNextVideo() async {

    await Future.delayed(const Duration(seconds: 3));
    final List<VideoPostEntity> newVideos = videoPosts.map(
    (video) => LocalVideModel.getJsonParse(video).getVideoPostfinal()
    ).toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}