import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 55,
            width: 55,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 12),
        )
      ],
    );
  }
}
