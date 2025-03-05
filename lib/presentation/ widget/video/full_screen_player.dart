import 'package:flutter/material.dart';
import 'package:pelis_app/presentation/%20widget/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
        }

        return GestureDetector(
          onTap: () {
            if (_controller.value.isPlaying) {
              _controller.pause();
              return;
            }
            _controller.play();
          },
          child: AspectRatio(aspectRatio: 
            _controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_controller),
                VideoBackground(stops: const [0.8, 1.0],),
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _CideoCaption(caption: widget.caption,)
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

class _CideoCaption extends StatelessWidget {
  final String caption;

  const _CideoCaption({ required this.caption});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 6,
      child: Text(caption, maxLines: 2, style: titleStyle,),
    );
  }
}