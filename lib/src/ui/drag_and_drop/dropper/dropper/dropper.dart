import 'package:dpro_editor/src/ui/dpro_editor/dpro_manager.dart';
import 'package:dpro_editor/src/ui/drag_and_drop/dropper/droper_hitter/drop_hitter.dart';
import 'package:flutter/material.dart';

class Dropper extends StatefulWidget {
  const Dropper({super.key});

  @override
  State<Dropper> createState() => _DropperState();
}

class _DropperState extends State<Dropper> {
  final myGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    DproManager.getInstance().setHitter(
      DropHitter(
        globalKey: myGlobalKey,
        hitListener: () {
          setState(() {
            isHitting = true;
          });
        },
        unHitListener: () {
          setState(() {
            isHitting = false;
          });
        },
      ),
    );
  }

  bool isHitting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: myGlobalKey,
      width: 10,
      height: 10,
      color: isHitting ? Colors.red : Colors.green,
    );
  }
}
