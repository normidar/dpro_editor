import 'package:dpro_editor/src/ui/dpro_editor/dpro_manager.dart';
import 'package:flutter/material.dart';

class Dragger extends StatelessWidget {
  const Dragger({
    super.key,
    required this.underMouse,
    required this.defaultShow,
    required this.draggedShow,
    this.dragOnEditorListener,
  });
  final Widget underMouse;
  final Widget defaultShow;
  final Widget draggedShow;
  final void Function(Offset)? dragOnEditorListener;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: underMouse,
      childWhenDragging: draggedShow,
      onDragUpdate: (details) {
        final box = DproManager.getInstance()
            .getGlobalKey()
            .currentContext
            ?.findRenderObject() as RenderBox?;
        assert(box != null);
        Offset position = box!.globalToLocal(details.globalPosition);
        dragOnEditorListener?.call(position);
      },
      child: defaultShow,
    );
  }
}
