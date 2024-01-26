import 'package:coffee_shop/pages/promotions_page.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/pages/profile_page.dart';
import 'package:coffee_shop/pages/register_page.dart';
import 'package:coffee_shop/pages/settings_page.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "KOFFEE KORNER",
          style: TextStyle(
            color: Colors.brown[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.brown[900]),
      ),
      drawer: Drawer(
        backgroundColor: Colors.brown[900],
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'lib/images/logo.png',
                height: 100,
              ),
            ),
            SizedBox(height: 30),
            buildDrawerItem(Icons.home, 'Home', '/homepage', 0),
            buildDrawerItem(Icons.settings, 'Settings', '/settingspage', 1),
          ],
        ),
      ),
      body: _buildHomeContent(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Promotions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedIconTheme: IconThemeData(color: Colors.brown),
        unselectedIconTheme: IconThemeData(color: Colors.brown[200]),
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String title, String route, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onTap: () {
          Navigator.pop(context);
          setState(() {
            _currentIndex = index;
          });
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }

  Widget _buildHomeContent(int index) {
    switch (index) {
      case 0:
        return _buildCoffeeOptions();
      case 1:
        return CartPage();
      case 2:
        return PromotionsPage();
      case 3:
        return ProfilePage();
      default:
        return Container();
    }
  }

  Widget _buildCoffeeOptions() {
    List<Map<String, String>> coffeeOptions = [
      {
        'name': 'Espresso',
        'imagePath': 'lib/images/coffee_1.jpg',
        'description': 'A strong black coffee made by forcing hot water through finely-ground coffee beans.'
      },
      {
        'name': 'Cappuccino',
        'imagePath': 'lib/images/coffee_2.jpg',
        'description': 'A coffee drink that is composed of a double espresso and equal parts of steamed milk and foam.'
      },
      {
        'name': 'Latte',
        'imagePath': 'lib/images/latte.jpg',
        'description': 'A coffee drink made with espresso and steamed milk.'
      },
      {
        'name': 'Americano',
        'imagePath': 'lib/images/americano.jpg',
        'description': 'A diluted espresso coffee, created by diluting a shot of espresso with hot water.'
      },
      {
        'name': 'Mocha',
        'imagePath': 'lib/images/mocha.jpg',
        'description': 'A chocolate-flavored version of a latte, often with whipped cream on top.'
      },
      {
        'name': 'Macchiato',
        'imagePath': 'lib/images/coffee_1.jpg',
        'description': 'An espresso with a small amount of milk or foam, usually served in a small cup.'
      },
      {
        'name': 'Flat White',
        'imagePath': 'lib/images/coffee_2.jpg',
        'description': 'A coffee drink consisting of espresso with microfoam, similar to a latte but with a higher proportion of coffee.'
      },
      {
        'name': 'Affogato',
        'imagePath': 'lib/images/latte.jpg',
        'description': 'A dessert consisting of a scoop of vanilla ice cream or gelato "drowned" with a shot of hot espresso.'
      },
      {
        'name': 'Irish Coffee',
        'imagePath': 'lib/images/mocha.jpg',
        'description': 'A cocktail consisting of hot coffee, Irish whiskey, and sugar, stirred, and topped with cream.'
      },
    ];

    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: coffeeOptions.length,
        itemBuilder: (context, index) {
          String imagePath = coffeeOptions[index]['imagePath']!;
          String name = coffeeOptions[index]['name']!;
          String description = coffeeOptions[index]['description']!;

          return Card(
            elevation: 3.0,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: ClipOval(
                child: Image.asset(
                  imagePath,
                  width: 80.0, // Adjust the width to control the size
                  height: 80.0, // Adjust the height to control the size
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(name),
              subtitle: Text(description),
              onTap: () {
                // Handle tapping on a coffee option
                // You can navigate to a details page or perform any action
              },
            ),
          );
        },
      ),
    );
  }
}