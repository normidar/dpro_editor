import 'package:dpro_editor/src/common/util/random_creator.dart';
import 'package:dpro_editor/src/ui/drag_and_drop/droper/droper_hitter/droper_hitter.dart';
import 'package:flutter/widgets.dart';

class DproManager {
  DproManager();
  static final DproManager _instance = DproManager();
  factory DproManager.getInstance() {
    return _instance;
  }

  // editor size
  Size? _editorSize;
  void setEditorSize(Size size) => _editorSize = size;
  Size getEditorSize() {
    assert(_editorSize != null);
    return _editorSize!;
  }

  // global key to get offset
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

  Map<String, DropHitter> hitterMap = <String, DropHitter>{};
  String setHitter(DropHitter hitter) {
    String randomString = RandomCreator.randomString();
    // to be careful
    while (hitterMap.containsKey(randomString)) {
      print("warning: randomString was already set");
      randomString = RandomCreator.randomString();
    }

    hitter.name = randomString;
    hitterMap[randomString] = hitter;
    return randomString;
  }

  DropHitter? hitting;
  void tryToHit(Offset offset, {double len = 100}) {
    if (hitterMap.isNotEmpty) {
      double lenSquared = len * len;
      DropHitter? closestHitter;
      double? closestDistance;
      for (var entry in hitterMap.entries) {
        if (closestHitter == null || closestDistance == null) {
          final distance = (entry.value.offset - offset).distanceSquared;
          if (distance < lenSquared) {
            closestHitter = entry.value;
            closestDistance = distance;
          }
          continue;
        }

        final distance = (closestHitter.offset - offset).distanceSquared;
        if (distance < closestDistance) {
          closestHitter = entry.value;
          closestDistance = (closestHitter.offset - offset).distanceSquared;
        }
      }
      if (closestHitter != null) {
        if (closestHitter != hitting) {
          hitting?.unHit();
          hitting = closestHitter;
          hitting?.hit();
        }
      }
    }
  }
}
