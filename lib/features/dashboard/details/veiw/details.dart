import 'package:flower_shop/cubits/cart/cart_cubit.dart';
import 'package:flower_shop/cubits/cart/cart_state.dart';
import 'package:flower_shop/cubits/favourite/favourite_cubit.dart';
import 'package:flower_shop/cubits/favourite/favourite_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/model/CategoryModel.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  static int count = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 217, 200, 202),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, favState) {
            final favoritesCubit = context.read<FavoritesCubit>();
            final isFavorite = favoritesCubit.isFavorite(widget.categoryModel);

            return BlocBuilder<CartCubit, CartState>(
              builder: (context, cartState) {
                final cartCubit = context.read<CartCubit>();
                final isInCart = cartCubit.isInCart(widget.categoryModel);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 100, right: 30),
                      child: Row(
                        children: [
                          const Text(
                            'Details',
                            style: TextStyle(
                                color: Color(0xFFBD8F97),
                                fontSize: 33,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Icon(
                              isFavorite
                                  ? CupertinoIcons.heart_fill
                                  : CupertinoIcons.heart,
                              color: const Color(0xFFBD8F97),
                              size: 35,
                            ),
                            onPressed: () {
                              if (isFavorite) {
                                favoritesCubit
                                    .removeFavorite(widget.categoryModel);
                              } else {
                                favoritesCubit
                                    .addFavorite(widget.categoryModel);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SizedBox(
                        height: 381,
                        width: 285,
                        child: Image(
                          image: AssetImage(widget.categoryModel.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(35),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xFFBD8F97),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.categoryModel.title,
                              style: const TextStyle(
                                  fontSize: 26, color: Colors.white),
                            ),
                            Text(
                              widget.categoryModel.description,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (count > 0) count--;
                                    });
                                  },
                                  icon: Container(
                                    width: 32,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: const CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.white,
                                      child: Icon(
                                        Icons.remove,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    '$count',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  icon: Container(
                                    width: 32,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: const CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.white,
                                      child: Icon(
                                        Icons.add,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    '\$${widget.categoryModel.price}',
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (isInCart) {
                                      cartCubit
                                          .removeCartItem(widget.categoryModel);
                                    } else {
                                      cartCubit
                                          .addCartItem(widget.categoryModel);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isInCart
                                        ? Colors
                                            .grey // Change button color when in cart
                                        : Colors.white,
                                    side: const BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Text(
                                    isInCart
                                        ? 'Remove from cart'
                                        : 'ADD to cart',
                                    style: const TextStyle(
                                        color: Color(0xFFBD8F97), fontSize: 22),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
