import 'package:flutter/material.dart';
import 'package:pelis_app/domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPostEntity>videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        Container(color: Colors.red,),
        Container(color: Colors.blue,)
      ],
    );
  }
}