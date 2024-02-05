import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item.dart';

class Cart extends ChangeNotifier{
  List<Item> hotBeverages=[
    Item(
      name: 'Latte',
      price: '600',
      description: 'Hot cup of latte',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 'Americano',
      price: '700',
      description: 'Strong shot of americano',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 'Mocha',
      price: '600',
      description: 'Mocha topped with whipped cream',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 'Cappucino',
      price: '500',
      description: 'Freshly brewed coffee with milk',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 'Espresso',
      price: '400',
      description: 'Strong shot of fresh coffee',
      imagePath:'lib/images/mocha.jpg',
    ),
  ];

  //list of items in the user cart
  List<Item> userCart = [];

 //get List of hot beverages items
  List<Item> getHotBeverages()
  {
    return hotBeverages;
  }

  //get cart
  List<Item> getUserCart()
  {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Item item){
    userCart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Item item){
    userCart.remove(item);
    notifyListeners();
  }

}