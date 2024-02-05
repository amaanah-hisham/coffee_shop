import 'package:flutter/material.dart';
import 'package:coffee_shop/components/my_textfield.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 20),

            // Profile Photo
            Stack(
              children: [
                // Profile Photo
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.brown, // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('lib/images/profile2.jpg'),
                  ),
                ),

                // Edit Icon
                Positioned(
                  bottom: 0,
                  right: 30,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.brown[900],
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: 16),

            // Edit Profile Link (Dummy Link)
            TextButton(
              onPressed: () {
                // Add logic to navigate to edit profile page
              },
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.brown[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 16),

            // Fields
            MyTextField(
              controller: TextEditingController(),
              hintText: 'anne105',
              obscureText: false,
            ),
            SizedBox(height: 16),

            MyTextField(
              controller: TextEditingController(),
              hintText: 'anne105@gmail.com',
              obscureText: false,
            ),

            SizedBox(height: 16),

            MyTextField(
              controller: TextEditingController(),
              hintText: '+94 78 6533 123',
              obscureText: false,
            ),

            SizedBox(height: 23),


            // save Button

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
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
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
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
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
