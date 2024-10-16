import 'package:flower_shop/features/dashboard/Cart/veiw/cart_view.dart';
import 'package:flower_shop/features/dashboard/Feedback%20form/veiw/fompage.dart';
import 'package:flower_shop/features/dashboard/favourite/veiw/favourite_view.dart';
import 'package:flower_shop/features/dashboard/follow%20order/veiw/followpage.dart';
import 'package:flower_shop/features/dashboard/home/model/CategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../CategoryPage/veiw/CategoryPage.dart';
import 'CategoryItemCustomWidget.dart';
import 'SpecialOfferCustomWidget.dart';

class Home extends StatelessWidget {
  final PageController pageController = PageController();
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

  final List<CategoryModel> categories = [
    CategoryModel(image: 'assets/Rectangle 8.png', title: 'Roses'),
    CategoryModel(image: 'assets/Rectangle 9.png', title: 'lilies '),
    CategoryModel(image: 'assets/Rectangle 10.png', title: 'seasonal'),
    CategoryModel(image: 'assets/Rectangle 14.png', title: 'uniflora'),
  ];
  Home({super.key});

  void onChangeTab(int index) {
    currentIndexNotifier.value = index;
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: currentIndexNotifier,
        builder: (context, currentIndex, _) {
          return PageView(
            controller: pageController,
            onPageChanged: (index) {
              onChangeTab(index);
            },
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
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
                      child: Text(
                        'Categories',
                        style:
                            TextStyle(color: Color(0xFFBD8F97), fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CategoryPage();
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(categories[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: CategoryItemCustomWidget(
                                  popular: false,
                                ).buttonNamesCategores(
                                  index: index,
                                  context: context,
                                  popular: false,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Special offer',
                      style: TextStyle(color: Color(0xFFBD8F97), fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    SpecialOfferCustomWidget(),
                    const SizedBox(height: 5),
                    const Text(
                      'Popular ',
                      style: TextStyle(color: Color(0xFFBD8F97), fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 150,
                      child: CategoryItemCustomWidget(
                        popular: true,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
              FavouriteView(),
              CartView(),
              FeedbackForm(),
              FollowOrder(),
            ],
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentIndexNotifier,
        builder: (context, currentIndex, _) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xFFBD8F97),
            currentIndex: currentIndex,
            selectedItemColor: const Color.fromARGB(255, 101, 136, 250),
            unselectedItemColor: const Color.fromARGB(255, 251, 250, 250),
            onTap: onChangeTab,
            selectedLabelStyle: const TextStyle(color: Colors.green),
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.star),
                label: 'FeedBack',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.map),
                label: 'Following Order',
              ),
            ],
          );
        },
      ),
    );
  }
}
