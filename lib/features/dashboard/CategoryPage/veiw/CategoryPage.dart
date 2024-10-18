import 'package:flower_shop/features/dashboard/home/model/CategoryModel.dart';
import 'package:flutter/material.dart';

import '../../details/veiw/details.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key, required this.categoryType});
  final String categoryType;

  final List<CategoryModel> Rosescategory = [
    CategoryModel(image: 'assets/flower1.jpg', title: 'Thrift', price: 90),
    CategoryModel(image: 'assets/flower2.jpg', title: 'Iris', price: 100),
    CategoryModel(image: 'assets/flower3.jpg', title: 'Daff', price: 900),
    CategoryModel(image: 'assets/flower4.jpg', title: 'Rose', price: 95),
    CategoryModel(image: 'assets/flower5.jpg', title: 'Freesia', price: 400),
    CategoryModel(image: 'assets/flower6.jpg', title: 'Pansy', price: 200),
    CategoryModel(image: 'assets/flower9.jpg', title: 'Daisy', price: 110),
    CategoryModel(image: 'assets/flower22.jpg', title: 'Tulip', price: 125),
  ];

  final List<CategoryModel> liliescategory = [
    CategoryModel(image: 'assets/flower7.jpg', title: 'Aster', price: 200),
    CategoryModel(image: 'assets/flower8.jpg', title: 'Lily', price: 120),
    CategoryModel(image: 'assets/flower9.jpg', title: 'Peony', price: 110),
    CategoryModel(image: 'assets/flower10.jpg', title: 'Lotus', price: 60),
    CategoryModel(image: 'assets/flower11.jpg', title: 'Zinnia', price: 80),
    CategoryModel(image: 'assets/flower12.jpg', title: 'Hyssop', price: 85),
    CategoryModel(image: 'assets/flower16.jpg', title: 'Prim', price: 115),
    CategoryModel(image: 'assets/flower3.jpg', title: 'Fern', price: 900),
  ];

  final List<CategoryModel> seasonalcategory = [
    CategoryModel(image: 'assets/flower13.jpg', title: 'Roses', price: 70),
    CategoryModel(image: 'assets/flower14.jpg', title: 'Lilies', price: 190),
    CategoryModel(image: 'assets/flower15.jpg', title: 'Sage', price: 65),
    CategoryModel(image: 'assets/flower16.jpg', title: 'Viola', price: 115),
    CategoryModel(image: 'assets/flower17.jpg', title: 'Holly', price: 105),
    CategoryModel(image: 'assets/flower18.jpg', title: 'Petal', price: 150),
    CategoryModel(image: 'assets/flower4.jpg', title: 'Anem', price: 95),
    CategoryModel(image: 'assets/flower20.jpg', title: 'Broom', price: 90),
  ];

  final List<CategoryModel> unifloracategory = [
    CategoryModel(image: 'assets/flower19.jpg', title: 'Crocus', price: 60),
    CategoryModel(image: 'assets/flower20.jpg', title: 'Lilies', price: 90),
    CategoryModel(image: 'assets/flower21.jpg', title: 'Clover', price: 100),
    CategoryModel(image: 'assets/flower22.jpg', title: 'Dahlia', price: 125),
    CategoryModel(image: 'assets/flower23.jpg', title: 'Fawn', price: 80),
    CategoryModel(image: 'assets/flower24.jpg', title: 'Plumb', price: 145),
    CategoryModel(image: 'assets/flower15.jpg', title: 'Lilac', price: 65),
    CategoryModel(image: 'assets/flower7.jpg', title: 'Azalea', price: 200),
  ];

  List<CategoryModel> _getCategoryList() {
    switch (categoryType) {
      case 'Rosescategory':
        return Rosescategory;
      case 'liliescategory':
        return liliescategory;
      case 'seasonalcategory':
        return seasonalcategory;
      case 'unifloracategory':
        return unifloracategory;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> selectedCategory = _getCategoryList();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 10),
            child: Center(
              child: Text(
                'All provided Flowers from this type',
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 54, 78), fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              scrollDirection: Axis.vertical,
              itemCount: selectedCategory.length,
              itemBuilder: (context, index) {
                final category = selectedCategory[index];
                return _buildCategoryItem(context, category);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
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
    );
  }

  Widget _buildCategoryItem(BuildContext context, CategoryModel category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 150,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(category.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 160, bottom: 5, right: 10, left: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Details(categoryModel: category);
                }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBD8F97),
              ),
              child: Row(
                children: [
                  Text(
                    category.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  Text(
                    '${category.price}\$',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
