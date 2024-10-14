import 'package:flutter/material.dart';

import '../model/CategoryModel.dart';

class SpecialOfferCustomWidget extends StatelessWidget {
  SpecialOfferCustomWidget({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(image: 'assets/Rectangle 14.png', price: 50, title: ''),
    CategoryModel(image: 'assets/Rectangle 15.png', price: 30, title: ''),
    CategoryModel(image: 'assets/Rectangle 16.png', price: 20, title: ''),
    CategoryModel(image: 'assets/Rectangle 20.png', price: 20, title: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Stack(
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(categories[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Transform.rotate(
                    angle: -0.7,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBD8F97),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '${categories[index].price}% off',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
