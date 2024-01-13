import 'package:flutter/material.dart';

class MyButtom1 extends StatelessWidget {
  final Function()? onTap;
  const MyButtom1({super.key, required this.onTap});

   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 62, 7, 150),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

    
  }
}
