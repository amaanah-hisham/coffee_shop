import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item.dart';

class Cart extends ChangeNotifier{
  List<Item> hotBeverages=[
    Item(
      name: 'Latte',
      price: '600',
      description: 'Hot cup of latte with freshley brewed coffee',
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


  //cold beverages

  List<Item> coldBeverages=[
    Item(
      name: 'L',
      price: '600',
      description: 'Hot cup of latte',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 'A',
      price: '700',
      description: 'Strong shot of americano',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 'M',
      price: '600',
      description: 'Mocha topped with whipped cream',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 'C',
      price: '500',
      description: 'Freshly brewed coffee with milk',
      imagePath:'lib/images/mocha.jpg',
    ),

  ];

  List<Item> getColdBeverages()
  {
    return coldBeverages;
  }

  //desserts

  List<Item> desserts=[
    Item(
      name: 'Liii',
      price: '600',
      description: 'Hot cup of latte',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 'Aaaa',
      price: '700',
      description: 'Strong shot of americano',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 'Miii',
      price: '600',
      description: 'Mocha topped with whipped cream',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 'Ciii',
      price: '500',
      description: 'Freshly brewed coffee with milk',
      imagePath:'lib/images/mocha.jpg',
    ),

  ];

  List<Item> getDesserts()
  {
    return desserts;
  }


  //getSavoury

  List<Item> savoury=[
    Item(
      name: 't',
      price: '600',
      description: 'Hot cup of latte',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 't',
      price: '700',
      description: 'Strong shot of americano',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 't',
      price: '600',
      description: 'Mocha topped with whipped cream',
      imagePath:'lib/images/mocha.jpg',
    ),
    Item(
      name: 't',
      price: '500',
      description: 'Freshly brewed coffee with milk',
      imagePath:'lib/images/mocha.jpg',
    ),

  ];

  List<Item> getSavoury()
  {
    return savoury;
  }

}