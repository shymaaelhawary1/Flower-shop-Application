import 'package:flower_shop/cubits/favourite/favourite_cubit.dart';
import 'package:flower_shop/cubits/favourite/favourite_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesInitial) {
            return Center(child: Text("No favorites yet."));
          } else if (state is FavoritesLoaded) {
            final favoriteItems = state.favoriteItems;

            if (favoriteItems.isEmpty) {
              return Center(child: Text("No favorites yet."));
            }

            return ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return ListTile(
                  leading: Image.asset(item.image), // Adjust if necessary
                  title: Text(item.title),
                  subtitle: Text(item.description),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
