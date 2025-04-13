
import 'package:flutter/material.dart';

class ShoesModel with ChangeNotifier {
  double _currentSizeShoe = 9;
  String _currentImageShoe = 'assets/imgs/azul.png';
  
  double currentSizeShoe() => _currentSizeShoe;

  set setCurrentSizeShoe(double currentSizeShow) {
    _currentSizeShoe = currentSizeShow;
    notifyListeners();
  }
  String currentImageShoe() => _currentImageShoe;

  set setCurrentImageShoe(String image) {
    _currentImageShoe = image;
    notifyListeners();
  }

}