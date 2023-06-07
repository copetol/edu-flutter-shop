import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/orders.dart';
import '../widgets/cart_item.dart' as ci;

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
                  onPressed: () {
                    Provider.of<Orders>(context, listen: false).addOrder(
                      cart.items.values.toList(),
                      cart.totalAmount
                    );
                    cart.clear();
                  },
                  style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                  child: const Text('Order now'),
                  )
              ]
            )
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) => ci.CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title
                )
            )
          )
        ]
      )
    );
  }
}
