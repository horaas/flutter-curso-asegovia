import 'package:disenos_app/presentation/slide_shows_screen.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = const SlideShowsScreen();

  Widget currentPage() => _currentPage;

  set setCurrentPage(Widget currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}
