import 'package:dpro_editor/src/ui/dpro_Item_bar/dpro_item_bar.dart';
import 'package:dpro_editor/src/ui/drag_and_drop/dropper/dropper/dropper.dart';
import 'package:flutter/material.dart';

class DproEditorContent extends StatelessWidget {
  const DproEditorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: Stack(children: const [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Center(
            child: DproItemBar(),
          ),
        ),
        Positioned(left: 50, top: 50, child: Dropper()),
        Positioned(left: 150, top: 150, child: Dropper()),
      ]),
    );
  }
}
