import 'package:flutter/material.dart';

class BasicInformationPageviewViewmodel extends ChangeNotifier {
  final BuildContext context;

  BasicInformationPageviewViewmodel({required this.context});

  final PageController pageController = PageController();
  int currentPage = 0;

  void changePage(int page) {
    currentPage = page;
    notifyListeners();
  }

   void nextPage() {
    if (currentPage < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  /// (Optional) for back button
  void previousPage() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
