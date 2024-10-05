import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/model/CategoryModel.dart';

class Details extends StatelessWidget {
  const Details( {super.key, required this.categoryModel});
  final count = 0;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 217, 200, 202),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 100, right: 30),
              child: Row(
                children: [
                  Text(
                    'Details',
                    style: TextStyle(
                        color: Color(0xFFBD8F97),
                        fontSize: 33,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    CupertinoIcons.heart,
                    color: Color(0xFFBD8F97),
                    size: 35,
                  )
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 381,
                width: 285,
                child: Image(
                  image: AssetImage(categoryModel.image),
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
                      categoryModel.title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                    ),
                     Text
                     (categoryModel.description
                      ,style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            // setState(() {
                            //   if (count > 0) count--;
                            // });
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
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            '$count',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // setState(() {
                            //   count++;
                            // });
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
                            '\$${categoryModel.price}',
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            'ADD to cart',
                            style: TextStyle(
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
        ),
      ),
    );
  }
}
