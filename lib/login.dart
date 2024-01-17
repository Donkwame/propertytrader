import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:propertytrader/component/auth_page.dart';
import 'package:propertytrader/component/my_buttom.dart';
import 'package:propertytrader/component/my_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

import 'package:propertytrader/component/square_title.dart';
import 'package:propertytrader/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Check login status when the widget initializes
  }

  // Function to check login status

  // Function to handle user login
  Future<void> logUserIn() async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Perform sign in
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Clear text controllers after successful login
      emailController.clear();
      passwordController.clear();

      // Save login status
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);

      // Pop the loading indicator

      // Navigate to the next page (Replace with your actual next page)
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthPage()),
      );
    } catch (error) {
      // Handle login errors, e.g., show a SnackBar
      showSnackBar('Login failed: ${error.toString()}');

      // Pop the loading indicator
    }
  }

  // Function to show a SnackBar
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 245),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image at the top
            Container(
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                child: Image.asset(
                  'lib/Start3.png', // Replace with the actual image path
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // login text
            const Text(
              'Let Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 12, 12, 12),
              ),
            ),
            const SizedBox(height: 25),
            // welcome message
            const Center(
              child: Wrap(
                children: [
                  Text(
                    'Welcome back, you\'ve been missed',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // username
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 25),
            // Password
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
              prefixIcon: Icons.lock,
            ),
            const SizedBox(height: 10),
            // forgot password
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color.fromARGB(255, 62, 7, 150)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // login button
            MyButton(
              onTap: () async {
                logUserIn();
              },
            ),
            const SizedBox(height: 20),
            // or
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 62, 7, 150),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // google button
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Squaretile(
                  imagepath: 'lib/Start4.png',
                ), // Fixed image path
                SizedBox(
                  width: 25,
                ),
                // facebook button
                Squaretile(imagepath: 'lib/Start5.png'), // Fixed image path
              ],
            ),
            const SizedBox(height: 25),
            // not a user
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Color.fromARGB(255, 62, 7, 150),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
