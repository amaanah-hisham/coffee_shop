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
        elevation: 7,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Image.asset(widget.item.imagePath),
            title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[900],
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Size: ${widget.item.selectedSize}',
                    style: TextStyle(color: Colors.brown[900], fontWeight: FontWeight.w500,),

                  ),
                  SizedBox(height: 6),
                ],
            ),
            subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LKR ${widget.item.price}',
                    style: TextStyle(
                      color: Colors.brown[900],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            widget.item.selectedQuantity--;
                          });
                        },
                      ),
                      Text(
                        '${widget.item.selectedQuantity}',
                        style: TextStyle(fontSize: 16, color: Colors.brown[900]),
                      ),
                      IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              widget.item.selectedQuantity++;
                            });
                          }),
                    ],
                  ),
                ],
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
