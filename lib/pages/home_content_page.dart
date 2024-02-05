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
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white, // Set background color
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Set input field background color
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search...',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (value) {
                              // Handle search query
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              InkWell(
                  onTap: () {
                    print(sliderIndex);
                  },
                  child: CarouselSlider(
                    items: imageList
                        .map(
                          (item)=> Image.asset(
                        item['image_path'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio:2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason){
                          setState(() {
                            sliderIndex = index;
                          });
                        }
                    ),
                  )
              )

            ],
          ),


          SizedBox(height: 30),


          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Hot Beverages',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:24,
                    ),
                  ),
                ],
              )
          ),

          SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
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
