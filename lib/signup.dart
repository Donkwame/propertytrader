import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:propertytrader/component/auth_page.dart';
import 'package:propertytrader/component/my_buttom1.dart';
import 'package:propertytrader/component/my_textfield.dart';
import 'package:propertytrader/component/square_title.dart';
import 'package:propertytrader/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatelessWidget {
  final Function()? onTap;

  SignUp({super.key, this.onTap});

  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmpasswordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phonenumberController = TextEditingController();

  Future<void> signUserUp(BuildContext context) async {
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

     try {
      final scaffoldMessenger = scaffoldMessengerKey.currentState;

      if (scaffoldMessenger != null) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text("Signing up..."),
          ),
        );
      }

       String password = passwordController.text;


      // Validate password length
    if (passwordController.text.length < 6) {
      // Password is too short
      throw PlatformException(
        code: 'ERROR_WEAK_PASSWORD',
        message: 'Password should be at least 6 characters',
      );
    }


       // Check for a mix of letters, numbers, and special characters
    RegExp passwordPattern = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{6,}$');

    if (!passwordPattern.hasMatch(password)) {
      // Password does not meet complexity requirements
      throw PlatformException(
        code: 'ERROR_WEAK_PASSWORD',
        message: 'Password should contain at least one letter, one number, and one special character.',
      );
    }

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Save user information to Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'firstName': firstnameController.text,
          'lastName': lastnameController.text,
          'phoneNumber': phonenumberController.text,
          'email': emailController.text,
        });
      }

      emailController.clear();
      passwordController.clear();
      firstnameController.clear();
      lastnameController.clear();
      phonenumberController.clear();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);

      Navigator.pushReplacement(
        scaffoldMessengerKey.currentContext!,
        MaterialPageRoute(builder: (context) => const AuthPage()),
      );
    } catch (error) {
      scaffoldMessengerKey.currentState!.showSnackBar(
        SnackBar(
          content: Text('Sign Up failed: ${_getErrorMessage(error)}'),
        ),
      );
    } finally {
      scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    }
  }

  String _getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      return error.message ?? 'Unknown error';
    } else {
      return 'An unexpected error occurred';
    }
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
                'Let Create an Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 12, 12),
                ),
              ),
              const SizedBox(height: 25),
              // welcome message
              const Center(
                child: Text(
                  'Welcome, We are happy to have join the family',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 25),

// user name

              MyTextField(
                controller: firstnameController,
                hintText: 'First Name',
                obscureText: false,
                prefixIcon: Icons.person,
              ),

              const SizedBox(height: 25),

              MyTextField(
                controller: lastnameController,
                hintText: 'Last Name',
                obscureText: false,
                prefixIcon: Icons.person,
              ),

              const SizedBox(height: 25),

              MyTextField(
                controller: phonenumberController,
                hintText: 'Phone Number',
                obscureText: false,
                prefixIcon: Icons.phone,
              ),

              const SizedBox(height: 25),

              //email

              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
                prefixIcon: Icons.email,
              ),

              const SizedBox(height: 25),

              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                prefixIcon: Icons.lock,
              ),

              const SizedBox(height: 25),

              MyTextField(
                controller: comfirmpasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
                prefixIcon: Icons.lock,
              ),

              const SizedBox(height: 25),

                  MyButtom1(
              onTap: () => signUserUp(context), // Pass context to the function
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
                    'You have an account',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the first button action
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text(
                      'Login',
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
        ));
  }
}
