import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context, listen: false).findById(productID);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(loadedProduct.imageUrl, fit: BoxFit.cover)
            ),
            const SizedBox(height: 10),
            Text('\$${loadedProduct.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20)
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15)
              )
            )
          ]
        )
      )
    );
  }
}
