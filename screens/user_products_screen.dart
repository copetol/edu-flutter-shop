import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  @override
  Widget build(BuildContext context) {
    final productsDate = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
            },
          )
        ]
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsDate.items.length,
          itemBuilder: (_,i) => Column(
            children: [
              UserProductItem(
                productsDate.items[i].title,
                productsDate.items[i].imageUrl
              ),
              Divider()
            ]
          )
        )
      )
    );
  }
}
