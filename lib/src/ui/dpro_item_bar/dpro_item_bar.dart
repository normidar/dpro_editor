import 'package:dpro_editor/src/ui/drag_and_drop/dragger/all_same_dragger.dart';
import 'package:flutter/material.dart';

class DproItemBar extends StatelessWidget {
  const DproItemBar({super.key, this.direction = Axis.horizontal});
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Wrap(
        direction: direction,
        children: const [
          AllSameDragger(child: Icon(Icons.ac_unit)),
        ],
      ),
    );
  }
}
