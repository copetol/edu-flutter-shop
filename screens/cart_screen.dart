import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20)
                ),
                const Spacer(),
                Chip(
                  label: Text('\$${cart.totalAmount}', style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary
                      )),
                  backgroundColor: Theme.of(context).colorScheme.primary
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                  child: const Text('Order now'),
                  )
              ]
            )
          ),
        ]
      )
    );
  }
}
