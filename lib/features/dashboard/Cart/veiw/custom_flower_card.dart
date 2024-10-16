import 'package:flutter/material.dart';

class CustomFlowerCard extends StatelessWidget {
  const CustomFlowerCard({
    super.key,
  });

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
              leading: Image.asset('assets/Rectangle 36.png'),
              title: const Text('Enchanted Cottage'),
              subtitle: const Text(
                  'It features a charmingassortment of fresh,garden-style flowers'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 20,
                    foregroundColor: Colors.pink,
                    backgroundColor: Colors.transparent,
                    child: StreamBuilder<Object>(
                        stream: null,
                        builder: (context, snapshot) {
                          return IconButton(
                              onPressed: () {}, icon: Icon(Icons.add));
                        })),
                const Text(
                  '1',
                  style: TextStyle(fontSize: 24),
                ),
                CircleAvatar(
                    foregroundColor: Colors.pink,
                    backgroundColor: Colors.transparent,
                    child: Center(
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.minimize)),
                    )),
                const Text('\$70')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
