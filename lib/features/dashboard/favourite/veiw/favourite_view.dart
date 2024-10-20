import 'package:flower_shop/features/dashboard/favourite/controller/favourite/favourite_cubit.dart';
import 'package:flower_shop/features/dashboard/favourite/controller/favourite/favourite_state.dart';
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
            return const Center(
              child: Text(
                "No favorites yet.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          } else if (state is FavoritesLoaded) {
            final favoriteItems = state.favoriteItems;

            if (favoriteItems.isEmpty) {
              return const Center(
                child: Text(
                  "No favorites yet.",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        item.image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      item.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        
                      },
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
