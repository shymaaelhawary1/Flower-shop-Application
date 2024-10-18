import 'package:flutter/material.dart';

import '../../details/veiw/details.dart';
import '../model/CategoryModel.dart';

class SpecialOfferCustomWidget extends StatelessWidget {
  SpecialOfferCustomWidget({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(
        image: 'assets/flower19.jpg', price: 150, title: 'graduation package'),
    CategoryModel(
        image: 'assets/flower17.jpg', price: 130, title: 'widding package'),
    CategoryModel(
        image: 'assets/flower11.jpg', price: 120, title: 'frinds package'),
    CategoryModel(
        image: 'assets/flower13.jpg', price: 145, title: 'special package'),
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
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Details(
                        categoryModel: categories[index],
                      );
                    }));
                  },
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(categories[index].image),
                        fit: BoxFit.cover,
                      ),
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
