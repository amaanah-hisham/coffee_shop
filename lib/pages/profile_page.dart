import 'package:flutter/material.dart';
import 'package:coffee_shop/components/my_textfield.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController mobileController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.brown,
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('lib/images/profile2.jpg'),
                    ),
                  ),
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
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // Add logic to navigate to edit profile page
                },
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.brown[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Username',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.brown[900],
                    ),
                  ),
                ),
              ),
              MyTextField(
                controller: usernameController,
                hintText: 'annemarie',
                obscureText: false,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.brown[900],
                    ),
                  ),
                ),
              ),
              MyTextField(
                controller: emailController,
                hintText: 'anne105@gmail.com',
                obscureText: false,
                validator: _validateEmail,
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Mobile',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.brown[900],
                    ),
                  ),
                ),
              ),
              MyTextField(
                controller: mobileController,
                hintText: '0786533123',
                obscureText: false,
                inputType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SizedBox(height: 23),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Save logic
                        print('Save button tapped');
                      }
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
                      // Cancel logic
                      print('Cancel button tapped');
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
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value != null && !value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }
}
