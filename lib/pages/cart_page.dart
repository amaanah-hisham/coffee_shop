import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';
import '../models/cart.dart';
import '../models/item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            SizedBox(height: 10),
            Container(
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/cart_banner3.png'),
                  fit: BoxFit.cover,

                ),
              ),

            ),
            SizedBox(height: 20),
            Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),

            ),

            SizedBox(height: 10),

            Expanded(
              child:ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index){
                  //get individual item
                  Item individualItem = value.getUserCart()[index];

                  //return cart item
                  return CartItem(item: individualItem,);
                }
              ),
            ),

            SizedBox(height: 15),

           Align(
             alignment: Alignment.topRight,
             child: GestureDetector(
              onTap: () {

              },
              child: Container(
                width: 120,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.brown[900],
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Center(
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
           ),
            SizedBox(height: 15),

          ],

        ),
      ),
    );
  }
}
