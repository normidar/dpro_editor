import 'package:flutter/widgets.dart';

/// a controller of the dropper to hit the dragger
/// that the controller can take some reaction
class DropHitter {
  DropHitter({
    required this.offset,
    required hitListener,
    required unHitListener,
  })  : _hitListener = hitListener,
        _unHitListener = unHitListener;
  String? name;

  final Offset offset;
  final void Function() _hitListener;
  final void Function() _unHitListener;

  void hit() {
    _hitListener();
  }

  void unHit() {
    _unHitListener();
  }
}
