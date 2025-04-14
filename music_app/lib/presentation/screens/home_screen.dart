import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:music_app/helpers/helpers.dart';
import 'package:music_app/models/playing_model.dart';
import 'package:music_app/presentation/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: _BackgroundGradient(
              child: Column(children: [
                CustomAppBar(),
                _MusicPlayer(),
              ])
            )
          ),
          _ContentLyrics(size: size)
        ],
      ),
    );
  }
}

class _BackgroundGradient extends StatelessWidget {
  final Widget child;
  const _BackgroundGradient({ required this.child,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 100),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [Color(0xFF33333E), Color(0xff201E28)],
        ),
      ),
      child: child
    );
  }
}

class _ContentLyrics extends StatelessWidget {
  const _ContentLyrics({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final lyric = getLyrics();
    return SizedBox(
      height: size.height * 0.25,
      child: ListWheelScrollView(
            itemExtent: 42,
            diameterRatio: 1.5,
            children: lyric.map((data) => Text(data, style: const TextStyle(
                  color: Color(0xFF959599),
                  fontSize: 18,
                 ),
                 textAlign: TextAlign.center,)).toList(),
          ),
    );
  }
}

class _MusicPlayer extends StatelessWidget {
  const _MusicPlayer();

  @override
  Widget build(BuildContext context) {
    return const Column(children: [_MusicPayig(), _MusicControls()]);
  }
}

class _MusicPayig extends StatelessWidget {
  const _MusicPayig();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          _DiskImage(size: size),
          const Expanded(
            child: _TimeLinePlaying()
          ),
        ],
      ),
    );
  }
}

class _DiskImage extends StatelessWidget {
  const _DiskImage({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    // bool isPlay = Provider.of<PlayingModel>(context).isPlaying();
    return Container(
      padding: const EdgeInsets.all(20),
      width: 240,
      height: 240,
      decoration: BoxDecoration(
        color: const Color(0xff201E28),
        borderRadius: BorderRadius.circular(200),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [Color(0xFF484750), Color(0xff1E1C24)],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              duration: const Duration(seconds: 10),
              infinite: true,
              manualTrigger: true,
              // animate: isPlay,
              controller: (controller) => Provider.of<PlayingModel>(context).setController = controller,
              child: Image.asset('assets/aurora.jpg')),
            Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                color: Colors.black38,
                shape: BoxShape.circle
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                color: Color(0xFF1C1C25),
                shape: BoxShape.circle
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeLinePlaying extends StatelessWidget {
  const _TimeLinePlaying();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('04:53', style: TextStyle(
          color: Color(0xFF959599)
        ),), Transform.rotate(
          angle: -1.57,
          child: const LinearProgressIndicator(value: 0.5, color: Color(0xFFD4D4D6) )), const Text('02:58', style: TextStyle(
            color: Color(0xFF959599)
          ),)]),
    );
  }
}

class _MusicControls extends StatelessWidget {
  const _MusicControls();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      margin: const EdgeInsets.only(top: 40),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Far Away', style: TextStyle(
                fontSize: 30,
                color: Color(0xFFD4D4D6)
              ),),
              Text('-Breaking Benjamin-', style: TextStyle(
                fontSize: 14,
                color: Color(0xFF959599)
              ),),
            ],
          ),
          _ButtonPlayControl()
        ],
      ),
    );
  }
}

class _ButtonPlayControl extends StatefulWidget {
  const _ButtonPlayControl();

  @override
  State<_ButtonPlayControl> createState() => _ButtonPlayControlState();
}

class _ButtonPlayControlState extends State<_ButtonPlayControl> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isPlay = false;


  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 100));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        print('play');
        if (isPlay) {
          controller.reverse();
          isPlay = !isPlay;
          Provider.of<PlayingModel>(context, listen: false).controller().stop();
          // Provider.of<PlayingModel>(context, listen: false).setIsPlaying = isPlay;
        } else {
          controller.forward();
          isPlay = !isPlay;
          Provider.of<PlayingModel>(context, listen: false).controller().repeat();
          // Provider.of<PlayingModel>(context, listen: false).setIsPlaying = isPlay;
        }
      },
      icon: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: controller, size: 40, color: Colors.black ,),
      //  const Icon(Icons.play_arrow, size: 40, color: Colors.black,),
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color(0xFFF8CA50))
      ),
    );
  }
}
