import 'package:dpro_editor/src/data/hit_info/hit_info.dart';
import 'package:dpro_editor/src/ui/dpro_editor/dpro_manager.dart';
import 'package:flutter/material.dart';

class Dragger extends StatelessWidget {
  const Dragger({
    super.key,
    required this.underMouse,
    required this.defaultShow,
    required this.draggedShow,
    required this.getHitInfo,
    this.dragOnEditorListener,
  });
  final Widget underMouse;
  final Widget defaultShow;
  final Widget draggedShow;
  final void Function(Offset)? dragOnEditorListener;
  final HitInfo Function() getHitInfo;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: underMouse,
      childWhenDragging: draggedShow,
      onDragUpdate: (details) {
        final position =
            DproManager.getInstance().countLocalOffset(details.globalPosition);
        DproManager.getInstance().tryToHit(position);
        dragOnEditorListener?.call(position);
      },
      onDragEnd: (details) {
        DproManager.getInstance().unHitAll(getHitInfo());
      },
      child: defaultShow,
    );
  }
}
