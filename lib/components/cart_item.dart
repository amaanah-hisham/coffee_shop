import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/item.dart';

class CartItem extends StatefulWidget{
  Item item;
  CartItem({super.key, required this.item,});

  @override
  State<CartItem> createState() => _CartItemState();

}

class _CartItemState extends State<CartItem>
{

  //remove from cart

  void removeItemFromCart()
  {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.item);
  }


  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.item.imagePath),
        title: Text(widget.item.name),
        subtitle: Text(widget.item.price),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ) ,
    ),
    );

  }
}