import 'package:pelis_app/domain/entities/video_post.dart';

abstract class VideoPostDataSource {

  Future<List<VideoPostEntity>> getFavoriteVideoNyUser(String userId);

  Future<List<VideoPostEntity>> getTredingVideosByPage(int page);

}