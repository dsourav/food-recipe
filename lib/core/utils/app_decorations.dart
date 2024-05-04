import 'package:flutter/material.dart';

abstract class AppDecorations {
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // #000000 with 20% opacity
            offset: const Offset(0, 4), // X: 0, Y: 4
            blurRadius: 4, // Blur: 4
            spreadRadius: 0, // Spread: 0
          ),
        ],
      );
}
