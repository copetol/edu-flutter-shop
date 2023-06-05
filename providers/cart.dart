import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({required this.id, required this.title, required this.quantity, required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }
  
  void addItem(String productID, double price, String title) {
    if(_items.containsKey(productID)) {
      _items.update(productID, (e) => CartItem(id: e.id, title: e.title, price: e.price, quantity: e.quantity + 1));
    } else {
      _items.putIfAbsent(productID, () => CartItem(id: DateTime.now().toString(), title: title, price: price, quantity: 1));
    }
  
  notifyListeners();
  }
}
