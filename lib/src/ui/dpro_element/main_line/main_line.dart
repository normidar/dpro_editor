import 'dart:math';

import 'package:dpro_editor/src/ui/dpro_element/main_line/main_line_clipper.dart';
import 'package:dpro_editor/src/ui/drag_and_drop/dropper/dropper/dropper.dart';
import 'package:flutter/material.dart';

class MainLine extends StatefulWidget {
  const MainLine({super.key});

  @override
  State<MainLine> createState() => _MainLineState();
}

class _MainLineState extends State<MainLine> {
  double _top = 10;

  double _left = 10;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _top,
      left: _left,
      child: Stack(children: [
        ClipPath(
          clipper: MainLineClipper(drawWidth: 20),
          child: GestureDetector(
            onPanUpdate: (details) {
              _top = max(0, _top + details.delta.dy);
              _left = max(0, _left + details.delta.dx);
              setState(() {});
            },
            child: Container(
              color: Colors.red,
              width: 100,
              height: 300,
            ),
          ),
        ),
        const Positioned(
          top: 20,
          left: 20,
          child: Dropper(),
        ),
      ]),
    );
  }
}
