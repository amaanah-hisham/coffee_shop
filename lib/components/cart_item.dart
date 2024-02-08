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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Image.asset(widget.item.imagePath),
            title: Text(
              widget.item.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
            ),
            subtitle: Text(
              "LKR ${widget.item.price}",
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.brown[900],
              onPressed: removeItemFromCart,
            ),
          ),
        ),
      ),
    );
  }


}
