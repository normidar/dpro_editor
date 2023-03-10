import 'package:flutter/material.dart';

class MainLineClipper extends CustomClipper<Path> {
  MainLineClipper({required this.drawWidth});
  final double drawWidth;

  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(drawWidth, size.height)
      ..lineTo(drawWidth, drawWidth)
      ..lineTo(size.width, drawWidth)
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
