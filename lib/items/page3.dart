import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_provider.dart';
import '../models/items.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.white,
            child: Column(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //pic
                Image.asset('lib/assets/torottobowl.png', width: 200),
                //name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Totoro Mini Wooden Bowl Japanese Style',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                //price
                Text('\$15.95'),
                //add icon
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    onPressed: () {
                      final item = Item(
                        name: 'Totoro Mini Wooden Bowl Japanese Style',
                        image: 'lib/assets/torottobowl.png',
                        price: 15.95,
                      );
                      context.read<CartProvider>().addItem(item);
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Added to cart')));
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
