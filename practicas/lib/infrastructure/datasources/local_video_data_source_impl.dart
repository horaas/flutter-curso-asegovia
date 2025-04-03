import 'package:pelis_app/domain/datasources/video_post_data_source.dart';
import 'package:pelis_app/domain/entities/video_post.dart';
import 'package:pelis_app/infrastructure/models/local_vide_model.dart';
import 'package:pelis_app/shared/data/local_video_post.dart';

class LocalVideoDataSourceImpl implements VideoPostDataSource {

  @override
  Future<List<VideoPostEntity>> getFavoriteVideoNyUser(String userId) {
    
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPostEntity>> getTredingVideosByPage(int page) async {
    
    await Future.delayed(const Duration(seconds: 10));
    final List<VideoPostEntity> newVideos = videoPosts.map(
    (video) => LocalVideModel.getJsonParse(video).getVideoPostfinal()
    ).toList();

    return newVideos;
  }


}