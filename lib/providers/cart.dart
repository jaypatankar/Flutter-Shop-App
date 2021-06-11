import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CardItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CardItem> _items;
  Map<String, CardItem> get items {
    return {...items};
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
          productId,
          (existingCartItem) => CardItem(
              id: existingCartItem.id,
              title: existingCartItem.id,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          productId,
          () => CardItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
  }
}
