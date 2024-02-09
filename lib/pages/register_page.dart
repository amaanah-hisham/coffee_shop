import 'package:flutter/material.dart';
import 'package:coffee_shop/components/my_textfield.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Image.asset(
                    'lib/images/logo.png',
                    height: 100,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Enter Your Details to Sign Up',
                    style: TextStyle(
                      color: Colors.brown[900],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: nameController,
                    hintText: 'Username',
                    obscureText: false,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))], // Allow alphabetical characters only
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    validator: _validateEmail,
                    inputType: TextInputType.emailAddress,

                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: mobileController,
                    hintText: 'Mobile Number',
                    obscureText: false,
                    inputType: TextInputType.phone, // Set input type to phone
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10), // Limit to 10 characters
                      FilteringTextInputFormatter.digitsOnly, // Restrict input to digits only
                    ],
                  ),

                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        String? fieldsValidationResult = _validateFields();
                        if (fieldsValidationResult != null) {
                          // Show message if any field is empty or email is invalid
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(fieldsValidationResult)),
                          );
                        } else {
                          // Proceed with sign up if all validations pass
                          signUserIn();
                          Navigator.pushNamed(context, '/login_page');
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.brown[900],
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  String? _validateFields() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        mobileController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      return 'Please fill all details to sign up';
    }
    return null;
  }


  String? _validateEmail(String? value) {
    if (value != null && !value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }
}
