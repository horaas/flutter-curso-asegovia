import 'package:pelis_app/domain/datasources/video_post_data_source.dart';
import 'package:pelis_app/domain/entities/video_post.dart';
import 'package:pelis_app/domain/repositories/video_post_repository.dart';

class VideoPostRepositoryImpl implements VideoPostDataRepository {

  final VideoPostDataSource videoPostDataSource;

  VideoPostRepositoryImpl({required this.videoPostDataSource});


  @override
  Future<List<VideoPostEntity>> getFavoriteVideoNyUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPostEntity>> getTredingVideosByPage(int page) {

    return videoPostDataSource.getTredingVideosByPage(page);
  }

}