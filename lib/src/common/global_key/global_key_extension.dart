import 'package:flutter/widgets.dart';

extension GlobalKeyExtension on GlobalKey {
  Offset countLocalOffset(Offset yourGlobalOffset) {
    final box = currentContext?.findRenderObject() as RenderBox?;
    assert(box != null);
    Offset? position = box?.globalToLocal(yourGlobalOffset);
    return position!;
  }

  Offset countLocalOffsetByKey(GlobalKey yourGlobalKey) {
    final box = currentContext?.findRenderObject() as RenderBox?;
    assert(box != null);

    final yourBox =
        yourGlobalKey.currentContext?.findRenderObject() as RenderBox?;
    assert(yourBox != null);

    Offset? position = box?.globalToLocal(yourBox!.localToGlobal(Offset.zero));
    return position!;
  }
}
