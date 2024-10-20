import 'package:flower_shop/features/dashboard/home/model/CategoryModel.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<CategoryModel> cartItems;

  CartLoaded(this.cartItems);
}

class CartItemAdded extends CartState {
  final CategoryModel item;
  CartItemAdded(this.item);
}

class CartItemRemoved extends CartState {
  final CategoryModel item;
  CartItemRemoved(this.item);
}
