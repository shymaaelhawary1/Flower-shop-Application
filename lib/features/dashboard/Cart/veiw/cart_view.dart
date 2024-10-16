
import 'package:flower_shop/features/dashboard/Cart/veiw/cart_list_view.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Cart',
            style: TextStyle(
                color: Color(0xFFBD8F97),
                fontWeight: FontWeight.bold,
                fontSize: 32),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const CartListView(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total :'),
                Text('\$170'),
              ],
            ),
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                      Color(0xFFBD8F97),
                    )),
                    onPressed: () {},
                    child: const Text('checkout')),
              ),
            ),
          ],
        ));
  }
}
