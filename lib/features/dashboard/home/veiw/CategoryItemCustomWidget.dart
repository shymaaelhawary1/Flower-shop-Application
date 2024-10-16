import 'package:flower_shop/features/dashboard/details/veiw/details.dart';
import 'package:flutter/material.dart';

import '../../CategoryPage/veiw/CategoryPage.dart';
import '../model/CategoryModel.dart';

class CategoryItemCustomWidget extends StatelessWidget {
  CategoryItemCustomWidget({
    super.key,
    required this.popular,
  });
  // final CategoryModel categoryModel;
  final bool popular;
  final List<CategoryModel> categories = [
    CategoryModel(image: 'assets/Rectangle 8.png', title: 'Roses', price: 90),
    CategoryModel(image: 'assets/Rectangle 9.png', title: 'lilies ', price: 70),
    CategoryModel(
        image: 'assets/Rectangle 10.png', title: 'seasonal', price: 50),
    CategoryModel(
        image: 'assets/Rectangle 14.png', title: 'uniflora', price: 45),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Details(
                categoryModel: categories[index],
              );
            })),
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(categories[index].image),
                  fit: BoxFit.cover,
                ),
              ),
              child: buttonNamesCategores(
                  popular: popular, index: index, context: context),
            ),
          ),
        );
      },
    );
  }

  Padding buttonNamesCategores(
      {required int index,
      required bool? popular,
      required BuildContext context}) {
    if (popular == false) {
      return Padding(
        padding:
            const EdgeInsets.only(top: 115, bottom: 5, right: 30, left: 30),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CategoryPage();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFBD8F97),
          ),
          child: Text(
            categories[index].title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 115, bottom: 5, right: 5, left: 0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Details(
                categoryModel: categories[index],
              );
            }));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFBD8F97),
          ),
          child: Row(
            children: [
              Text(
                categories[index].title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Text(
                '${categories[index].price}\$',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
