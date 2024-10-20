import 'package:flower_shop/features/dashboard/home/model/CategoryModel.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<CategoryModel> favoriteItems;

  FavoritesLoaded(this.favoriteItems);
}

class FavoriteItemAdded extends FavoritesState {
  final CategoryModel item;

  FavoriteItemAdded(this.item);
}

class FavoriteItemRemoved extends FavoritesState {
  final CategoryModel item;

  FavoriteItemRemoved(this.item);
}
