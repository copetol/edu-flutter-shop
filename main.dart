import 'package:flutter/material.dart';
import './screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'MyShop',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary:  Colors.purple,
          secondary: Colors.deepOrange,
        ),
        textTheme: theme.textTheme.apply(
          fontFamily: 'Lato'
        ) 
      ),
      home: ProductsOverviewScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: Center(
        child: Text('Let\'s build a shop!'),
      ),
    );
  }
}
