import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CategoryItemCustomWidget.dart';
import 'SpecialOfferCustomWidget.dart';

class Home extends StatelessWidget {
  final PageController pageController = PageController();
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

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
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
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
                        style: TextStyle(color: Color(0xFFBD8F97), fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: CategoryItemCustomWidget(
                        popular: false,
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
                 const SizedBox(height: 5,) 

                  ],
                ),
              ),
              // const FavoritePage(),
              // ReservationPage(),
              // const DeliveryPage(),
              // const ChatPage(),
            ],
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentIndexNotifier,
        builder: (context, currentIndex, _) {
          return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
            backgroundColor:const Color(0xFFBD8F97),
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
                icon: Icon(CupertinoIcons.chat_bubble_text),
                label: 'Chat',
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
