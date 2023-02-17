import 'package:dpro_editor/src/data/hit_info/hit_info.dart';
import 'package:dpro_editor/src/ui/drag_and_drop/dragger/dragger.dart';
import 'package:flutter/material.dart';

class AllSameDragger extends StatelessWidget {
  const AllSameDragger({
    super.key,
    required this.child,
    required this.getHitInfo,
    this.dragOnEditorListener,
  });
  final Widget child;
  final void Function(Offset)? dragOnEditorListener;
  final HitInfo Function() getHitInfo;

  @override
  Widget build(BuildContext context) {
    return Dragger(
      underMouse: child,
      defaultShow: child,
      draggedShow: child,
      dragOnEditorListener: dragOnEditorListener,
      getHitInfo: getHitInfo,
    );
  }
}
