import 'package:flutter/widgets.dart';

class DproManager {
  DproManager();
  static final DproManager _instance = DproManager();
  factory DproManager.getInstance() {
    return _instance;
  }

  Size? _editorSize;
  void setEditorSize(Size size) => _editorSize = size;
  Size getEditorSize() {
    assert(_editorSize != null);
    return _editorSize!;
  }

  GlobalKey? _globalKey;
  void setGlobalKey(GlobalKey globalKey) => _globalKey = globalKey;
  GlobalKey getGlobalKey() {
    assert(_globalKey != null);
    return _globalKey!;
  }
  Offset? getGlobalOffset() {
    assert(_globalKey != null);
    final box = _globalKey!.currentContext?.findRenderObject() as RenderBox?;
    final position = box?.localToGlobal(Offset.zero);
    return position;
  }
}
