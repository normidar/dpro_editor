import 'package:dpro_editor/src/data/hit_info/hit_info.dart';
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
        children: [
          AllSameDragger(
            child: const Icon(Icons.ac_unit),
            getHitInfo: () => HitInfo(hitMessage: 'hitMessage'),
          ),
        ],
      ),
    );
  }
}
