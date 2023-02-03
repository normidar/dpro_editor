import 'package:dpro_editor/src/common/global_key/global_key_extension.dart';
import 'package:dpro_editor/src/common/util/random_creator.dart';
import 'package:dpro_editor/src/ui/drag_and_drop/dropper/droper_hitter/drop_hitter.dart';
import 'package:flutter/foundation.dart';
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
  Offset countLocalOffset(Offset yourGlobalOffset) =>
      _globalKey!.countLocalOffset(yourGlobalOffset);
  Offset countLocalOffsetByKey(GlobalKey yourGlobalKey) =>
      _globalKey!.countLocalOffsetByKey(yourGlobalKey);

  final Map<String, DropHitter> _hitterMap = <String, DropHitter>{};
  String setHitter(DropHitter hitter) {
    String randomString = RandomCreator.randomString();
    // to be careful
    while (_hitterMap.containsKey(randomString)) {
      if (kDebugMode) {
        print("warning: randomString was already set");
      }
      randomString = RandomCreator.randomString();
    }

    hitter.name = randomString;
    _hitterMap[randomString] = hitter;
    return randomString;
  }

  DropHitter? _hitting;
  void tryToHit(Offset offset, {double len = 100}) {
    if (_hitterMap.isNotEmpty) {
      double lenSquared = len * len;
      DropHitter? closestHitter;
      double? closestDistance;
      for (var entry in _hitterMap.entries) {
        if (closestHitter == null || closestDistance == null) {
          final distance = (entry.value.getOffset() - offset).distanceSquared;
          if (distance < lenSquared) {
            closestHitter = entry.value;
            closestDistance = distance;
          }
          continue;
        }

        final closeHitterOffset = closestHitter.getOffset();
        final distance = (closeHitterOffset - offset).distanceSquared;
        if (distance < closestDistance) {
          closestHitter = entry.value;
          closestDistance = (closeHitterOffset - offset).distanceSquared;
        }
      }

      if (closestHitter != null) {
        if (closestHitter != _hitting) {
          _hitting?.unHit();
          _hitting = closestHitter;
          _hitting?.hit();
        }
      } else if (_hitting != null) {
        _hitting?.unHit();
        _hitting = null;
      }
    }
  }

  void unHitAll() {
    _hitting?.unHit();
    _hitting = null;
  }
}
