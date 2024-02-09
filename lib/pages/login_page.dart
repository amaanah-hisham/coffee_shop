import 'package:flutter/material.dart';
import 'package:coffee_shop/components/my_button.dart';
import 'package:coffee_shop/components/my_textfield.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  // text editing controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // sign user in method
  void signUserIn(BuildContext context) {
    // Your sign-in logic goes here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                // logo
                Image.asset(
                  'lib/images/logo.png',
                  height: 100,
                ),
                const SizedBox(height: 50),
                // welcome back !
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.brown[900],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))], // Allow alphabetical characters only
                ),
                const SizedBox(height: 10),
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.brown[900]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                // sign in button
                GestureDetector(
                  onTap: () {
                    String? fieldsValidationResult = _validateFields();
                    if (fieldsValidationResult != null) {
                      // Show message if any field is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(fieldsValidationResult)),
                      );
                    } else {
                      // Proceed with login if all validations pass
                      signUserIn(context);
                      Navigator.pushNamed(context, '/homepage');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.brown[900],
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: const Center(
                      child: Text(
                        "Log In",
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
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.brown[900]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/registerpage');
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validateFields() {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      return 'Please enter your Username and Password';
    }
    return null;
    }
}
