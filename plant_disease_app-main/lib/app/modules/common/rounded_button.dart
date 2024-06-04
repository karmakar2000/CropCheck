import 'package:flutter/material.dart';
import 'package:plant_disease/app/config/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.click, required this.child})
      : super(key: key);
  final VoidCallback click;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: click,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColor.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: AppColor.primaryColor),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
