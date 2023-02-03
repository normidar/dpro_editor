import 'package:dpro_editor/src/ui/dpro_editor/dpro_manager.dart';
import 'package:flutter/material.dart';

import 'dpro_editor_content.dart';

class DproEditor extends StatelessWidget {
  const DproEditor({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = GlobalKey();
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final instance = DproManager.getInstance();
      instance.setEditorSize(Size(constraints.maxWidth, constraints.maxHeight));
      instance.setGlobalKey(globalKey);

      return Container(
        key: globalKey,
        color: Colors.amber,
        child: const DproEditorContent(),
      );
    });
  }
}
