import 'package:flutter/material.dart';

class SolutionList extends StatelessWidget {
  final String solution;

  const SolutionList({Key? key, required this.solution}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var my = solution.split("**");

    return RichText(
      text: TextSpan(
        children: [
          ...my
              .map(
                (e) => TextSpan(
                  text: e.replaceAll('*', '').replaceAll('#', ''),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
