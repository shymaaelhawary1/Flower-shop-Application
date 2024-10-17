import 'package:flower_shop/features/dashboard/home/model/CategoryModel.dart';
import 'package:flutter/material.dart';

class CustomFlowerCard extends StatelessWidget {
  const CustomFlowerCard({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Container(
        height: 150,
        width: 400,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(10, 10),
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                categoryModel.image,
              ),
              title: Text(
                categoryModel.title,
              ),
              subtitle: Text(
                categoryModel.description,
              ),
            ),
            const Text('\$70'),
          ],
        ),
      ),
    );
  }
}
