import 'package:flutter/material.dart';
import 'package:plant_disease/app/config/constants.dart';

class ProcessingWidget extends StatelessWidget {
  const ProcessingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularProgressIndicator(
          color: AppColor.secondaryColor,
        ),
        const SizedBox(height: 8),
        const Text(
          "Processing...",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
