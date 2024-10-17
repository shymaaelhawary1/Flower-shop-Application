import 'package:bloc/bloc.dart';
import 'package:flower_shop/cubits/favourite/favourite_state.dart';
import 'package:flower_shop/features/dashboard/home/model/CategoryModel.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  final List<CategoryModel> _favoriteItems = [];

  void loadFavorites() {
    emit(FavoritesLoaded(_favoriteItems));
  }

  void addFavorite(CategoryModel item) {
    _favoriteItems.add(item);
    emit(FavoriteItemAdded(item));
    emit(FavoritesLoaded(_favoriteItems)); // Re-emit the list after adding
  }

  void removeFavorite(CategoryModel item) {
    _favoriteItems.remove(item);
    emit(FavoriteItemRemoved(item));
    emit(FavoritesLoaded(_favoriteItems)); // Re-emit the list after removing
  }

  bool isFavorite(CategoryModel item) {
    return _favoriteItems.contains(item);
  }
}
