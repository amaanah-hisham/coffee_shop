import 'package:flutter/material.dart';

import '../models/item.dart';


class ItemCard extends StatelessWidget {
  Item item;
  ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 25),
        width: 280,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //pic
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(item.imagePath),
              ),


              //description
              Text(
                item.description,
                style: TextStyle(color: Colors.grey[600]),
              ),


              //name + price
              Padding(
                padding: EdgeInsets.only(left: 25.0),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),

                        Text(
                          'LKR' + item.price,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    //button to add to cart
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.brown[900],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),


              ),
            ],
            ),
        );
    }
}
