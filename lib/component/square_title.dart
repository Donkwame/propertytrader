import 'package:flutter/material.dart';

class Squaretile extends StatelessWidget {
  final String imagepath;

  const Squaretile({
    super.key,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 62, 7, 150)),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade200),
      child: Image.asset(
        imagepath,
        height: 40,
      ),
    );
  }
}
