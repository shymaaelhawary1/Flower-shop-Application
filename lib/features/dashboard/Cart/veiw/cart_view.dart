import 'package:flower_shop/cubits/cart/cart_cubit.dart';
import 'package:flower_shop/cubits/cart/cart_state.dart';
import 'package:flower_shop/features/dashboard/Cart/veiw/cart_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Color(0xFFBD8F97),
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartInitial) {
            return const Center(child: Text("Your cart is empty."));
          } else if (state is CartLoaded) {
            final cartItems = state.cartItems;
            final totalPrice = cartItems.fold(
              0.0, // Start with 0.0 for a double value
              (previousValue, item) =>
                  previousValue + (item.price * item.quantity),
            );

            return Column(
              children: [
                const CartListView(), // Assuming this already displays the list of items.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total:'),
                    Text('\$${totalPrice.toStringAsFixed(2)}'),
                  ],
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFBD8F97),
                      ),
                      onPressed: () {
                        // Implement checkout logic here
                      },
                      child: const Text('Checkout'),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
