import 'package:dpro_editor/src/ui/dpro_editor/dpro_manager.dart';
import 'package:flutter/widgets.dart';

/// a controller of the dropper to hit the dragger
/// that the controller can take some reaction
class DropHitter {
  DropHitter({
    required GlobalKey globalKey,
    required hitListener,
    required unHitListener,
  })  : _globalKey = globalKey,
        _hitListener = hitListener,
        _unHitListener = unHitListener;
  String? name;

  final GlobalKey _globalKey;
  final void Function() _hitListener;
  final void Function() _unHitListener;

  Offset getOffset() {
    return DproManager.getInstance().countLocalOffsetByKey(_globalKey);
  }

  void hit() {
    _hitListener();
  }

  void unHit() {
    _unHitListener();
  }
}
