import 'package:coffee_shop/models/item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/item_card.dart';

class HomeContentPage extends StatefulWidget {
  const HomeContentPage({Key? key}) : super(key: key);

  @override
  _HomeContentPageState createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContentPage> {
  List imageList = [
    {"id": 1, "image_path": 'lib/images/coffee_2.jpg'},
    {"id": 2, "image_path": 'lib/images/coffee_1.jpg'},
    {"id": 3, "image_path": 'lib/images/latte.jpg'}
  ];
  final CarouselController carouselController = CarouselController();

  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [


            ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                //create an item
                Item item = Item(
                    name: 'Americano',
                    price: 'Rs 500',
                    description: 'Americano in large',
                    imagePath: 'lib/images/americano.jpg');
                return ItemCard(
                  item: item,
                );
              },
            ),


          Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
            child: Divider(
              color: Colors.white,

            ),
          ),
        ],


            ),
        );
    }
}
