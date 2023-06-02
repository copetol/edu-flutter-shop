import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

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
          )
        ]
      ),
      body: ProductsGrid(_showOnlyFavorites)
    );
  }
}
