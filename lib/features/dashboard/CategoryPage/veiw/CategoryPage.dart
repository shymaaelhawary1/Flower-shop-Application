import 'package:flower_shop/features/dashboard/home/model/CategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/veiw/CategoryItemCustomWidget.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(image: 'assets/Rectangle 8.png', title: 'Roses'),
    CategoryModel(image: 'assets/Rectangle 9.png', title: 'lilies '),
    CategoryModel(image: 'assets/Rectangle 10.png', title: 'seasonal'),
    CategoryModel(image: 'assets/Rectangle 14.png', title: 'uniflora'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFBD8F97),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFD9D9D9),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.list),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 10),
            child: Center(
              child: Text(
                'All provided Flowers form this type',
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 54, 78), fontSize: 20),
              ),
            ),
          ),
          SizedBox(
              width: 150,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                scrollDirection: Axis.vertical,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CategoryItemCustomWidget(
                      popular: true,
                    ),
                  );
                },
              ),
              ),
        ]
        ),
      ),
    );
  }
}
