import 'package:flutter/material.dart';

class PlayingModel with ChangeNotifier {
  bool _isPlaying = false;
  late AnimationController _controller;

  bool isPlaying() => _isPlaying;

  set setIsPlaying(bool otption) {
    _isPlaying = otption;
    notifyListeners();
  }

  AnimationController controller() => _controller;

  set setController(AnimationController controller) {
    _controller = controller;
  }


}