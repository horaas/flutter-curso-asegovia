import 'package:flutter/material.dart';
import 'package:pelis_app/domain/entities/video_post.dart';
import 'package:pelis_app/presentation/%20widget/shared/video_buttons.dart';
import 'package:pelis_app/presentation/%20widget/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPostEntity>videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                videUrl: videoPost.videoUrl,
                caption: videoPost.caption,
              ),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
            )
          ],
        );
      },
      // children: [
      //   Container(color: Colors.red,),
      //   Container(color: Colors.blue,)
      // ],
    );
  }
}