import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import './cart_screen.dart';

enum FilterOptions {favorites, all}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if(selectedValue == FilterOptions.favorites){
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            }, 
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Favorites'), 
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('All'),
              )
            ]
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => MyBadge(
              value: cart.itemCount.toString(),
              child: ch!
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {Navigator.of(context).pushNamed(CartScreen.routeName);},
            ),

          )
        ]
      ),
      body: ProductsGrid(_showOnlyFavorites)
    );
  }
}
