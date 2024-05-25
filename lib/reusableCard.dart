// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key, required this.colour, required this.childCard, required this.borderRadius});
  final Color colour;
  final Widget childCard;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: colour,
        // border: Border.all(width: 3,color: Colors.white,)
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Center(child: childCard,),
    );
  }
}