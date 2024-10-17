// cart_list_view.dart

import 'package:flower_shop/cubits/cart/cart_cubit.dart';
import 'package:flower_shop/cubits/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListView extends StatelessWidget {
  const CartListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            final cartItems = state.cartItems;

            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.asset(item.image), // Adjust if necessary
                  title: Text(item.title),
                  subtitle: Text(
                      '\$${item.price} x ${item.quantity}'), // Adjust for quantity
                );
              },
            );
          }
          return const Center(child: Text("No items in cart."));
        },
      ),
    );
  }
}
