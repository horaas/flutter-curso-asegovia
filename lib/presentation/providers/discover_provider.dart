import 'package:flutter/material.dart';
import 'package:pelis_app/domain/entities/video_post.dart';
import 'package:pelis_app/infrastructure/repositories/video_post_repository_impl.dart';

class DiscoverProvider extends ChangeNotifier {

  final VideoPostRepositoryImpl videoPostRepository;

  bool initialLoading = true;
  List <VideoPostEntity> videos = [];

  DiscoverProvider({required this.videoPostRepository});


  Future<void> loadNextVideo() async {

    // await Future.delayed(const Duration(seconds: 3));
    // final List<VideoPostEntity> newVideos = videoPosts.map(
    // (video) => LocalVideModel.getJsonParse(video).getVideoPostfinal()
    // ).toList();


    final newVideos = await videoPostRepository.getTredingVideosByPage(0);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}