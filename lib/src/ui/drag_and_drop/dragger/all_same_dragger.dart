import 'package:dpro_editor/src/ui/drag_and_drop/dragger/dragger.dart';
import 'package:flutter/material.dart';

class AllSameDragger extends StatelessWidget {
  const AllSameDragger({
    super.key,
    required this.child,
    this.dragOnEditorListener,
  });
  final Widget child;
  final void Function(Offset)? dragOnEditorListener;

  @override
  Widget build(BuildContext context) {
    return Dragger(
      underMouse: child,
      defaultShow: child,
      draggedShow: child,
      dragOnEditorListener: dragOnEditorListener,
    );
  }
}
