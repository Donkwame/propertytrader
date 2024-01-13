import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:propertytrader/component/auth_page.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final Logger _logger = Logger();

  MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 62, 7, 150),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          // Log the tap event using the logger package
          _logger.i('Login button tapped!');

          // Execute the provided onTap function
          onTap();

          // Navigate to AuthPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AuthPage()),
          );
        },
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
