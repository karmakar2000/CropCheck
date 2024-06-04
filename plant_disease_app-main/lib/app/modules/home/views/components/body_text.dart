import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  const BodyText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Heal Your Crop",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Available Crops: Potato, Tomato, Apple etc",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
