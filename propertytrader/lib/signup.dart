import 'package:flutter/material.dart';
import 'package:propertytrader/component/my_buttom1.dart';
import 'package:propertytrader/component/my_textfield.dart';
import 'package:propertytrader/component/square_title.dart';
import 'package:propertytrader/login.dart';

class SignUp extends StatelessWidget {
  final Function()? onTap;
  SignUp({super.key, this.onTap});
  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmpasswordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phonenumberController = TextEditingController();

  void signuserup() {
    // Implement your login logic here
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
                controller: usernameController,
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
                onTap: signuserup,
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
