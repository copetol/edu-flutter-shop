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
  
  double get totalAmount {
    var total = 0.0;
    _items.forEach((i, e) {
      total += e.price + e.quantity;
    });
    return total;
  }

  void addItem(String productID, double price, String title) {
    if(_items.containsKey(productID)) {
      _items.update(productID, (e) => CartItem(id: e.id, title: e.title, price: e.price, quantity: e.quantity + 1));
    } else {
      _items.putIfAbsent(productID, () => CartItem(id: DateTime.now().toString(), title: title, price: price, quantity: 1));
    }
  
  notifyListeners();
  }
  
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if(!_items.containsKey(id)) {
      return;
    }
    if(_items[id]!.quantity > 1) {
      _items.update(id, (e) => CartItem(
        id: e.id,
        title: e.title,
        price: e.price,
        quantity: e.quantity-1
      ));
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}

