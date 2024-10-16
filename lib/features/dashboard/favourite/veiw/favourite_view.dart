import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  final PageController pageController = PageController();
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);
  FavouriteView({super.key});
  void onChangeTab(int index) {
    currentIndexNotifier.value = index;
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite',
          style: TextStyle(
              color: Color(0xFFBD8F97),
              fontWeight: FontWeight.bold,
              fontSize: 32),
        ),
        centerTitle: true,
      ),
    );
  }
}
