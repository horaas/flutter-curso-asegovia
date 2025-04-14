import 'package:flutter/material.dart';

class PlayingModel with ChangeNotifier {
  bool _isPlaying = false;
  
  bool isPlaying() => _isPlaying;

  set setIsPlaying(bool otption) {
    _isPlaying = otption;
    notifyListeners();
  }

}