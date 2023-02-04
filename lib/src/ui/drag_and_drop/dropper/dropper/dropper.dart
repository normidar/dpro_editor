import 'package:dpro_editor/src/ui/dpro_editor/dpro_manager.dart';
import 'package:dpro_editor/src/ui/drag_and_drop/dropper/droper_hitter/drop_hitter.dart';
import 'package:flutter/material.dart';

class Dropper extends StatefulWidget {
  const Dropper({super.key});

  @override
  State<Dropper> createState() => _DropperState();
}

class _DropperState extends State<Dropper> with SingleTickerProviderStateMixin {
  final myGlobalKey = GlobalKey();

  // animation
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    DproManager.getInstance().setHitter(
      DropHitter(
        globalKey: myGlobalKey,
        hitListener: () {
          controller.forward();
        },
        unHitListener: () {
          controller.reverse();
        },
      ),
    );
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    animation = Tween<double>(begin: 5, end: 50).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  bool isHitting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: myGlobalKey,
      width: animation.value,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(width: 1.5, color: Colors.grey.shade800),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
