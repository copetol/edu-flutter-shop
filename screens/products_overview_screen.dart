import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';
import '../providers/products.dart';

enum FilterOptions {favorites, all}

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if(selectedValue == FilterOptions.favorites){
                productsContainer.showFavoritesOnly();
              } else {
                productsContainer.showAll();
              }
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
          )
        ]
      ),
      body: ProductsGrid()
    );
  }
}
