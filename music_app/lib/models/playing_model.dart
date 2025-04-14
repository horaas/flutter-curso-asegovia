import 'package:flutter/material.dart';

class PlayingModel with ChangeNotifier {
  bool _isPlaying = false;
  late AnimationController _controller;
  late Duration _current = const Duration(milliseconds: 0);
  late Duration _songDuration = const Duration(milliseconds: 0);



  String get songTotalDuration => printDuration(_songDuration);
  String get currentSecond =>  printDuration(_current);

  double get porcentaje => (_songDuration.inSeconds > 0) ? _current.inSeconds / _songDuration.inSeconds : 0;


  bool isPlaying() => _isPlaying;

  set setIsPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  AnimationController controller() => _controller;

  set setController(AnimationController controller) {
    _controller = controller;
  }

  Duration current() => _current;

  set setcurrent(Duration value) {
    _current = value;
    notifyListeners();
  }
  Duration songDuration() => _songDuration;

  set setsongDuration(Duration value) {
    _songDuration = value;
    notifyListeners();
  }


  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }
    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitsMinutes:$twoDigitsSeconds';
  }
}