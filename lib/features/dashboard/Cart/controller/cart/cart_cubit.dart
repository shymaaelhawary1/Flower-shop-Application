import 'package:bloc/bloc.dart';
import 'package:flower_shop/features/dashboard/home/model/CategoryModel.dart';
import 'cart_state.dart'; // Import CartState

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<CategoryModel> _cartItems = [];

  void loadCart() {
    emit(CartLoaded(_cartItems));
  }

  void addCartItem(CategoryModel item) {
    _cartItems.add(item);
    emit(CartItemAdded(item));
    emit(CartLoaded(_cartItems)); // Re-emit the list after adding an item
  }

  void removeCartItem(CategoryModel item) {
    _cartItems.remove(item);
    emit(CartItemRemoved(item));
    emit(CartLoaded(_cartItems)); // Re-emit the list after removing an item
  }

  bool isInCart(CategoryModel item) {
    return _cartItems.contains(item);
  }
}
