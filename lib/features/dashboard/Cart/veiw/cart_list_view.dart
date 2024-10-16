import 'package:flower_shop/features/dashboard/Cart/veiw/custom_flower_card.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return const CustomFlowerCard();
          }),
    );
  }
}
