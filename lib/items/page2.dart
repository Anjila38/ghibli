import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_provider.dart';
import '../models/items.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
                Image.asset('lib/assets/kiki.png', width: 170),
                //name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Kiki’s Delivery Service Jiji Night Lamp',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                //price
                Text('\$17.95'),
                //add icon
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    onPressed: () {
                      final item = Item(
                        name: 'Kiki’s Delivery Service Jiji Night Lamp',
                        image: 'lib/assets/kiki.png',
                        price: 17.95,
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
