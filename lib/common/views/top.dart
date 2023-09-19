import 'package:flutter/material.dart';

import '../utils/button_utils.dart';

//通用顶部样式
class Top {
  static AppBar getAppBar(String title) => AppBar(
        leading: Buttons.getIconButton(()=>print("object"),Icons.menu),
        title: Text(title),
        actions: [
          Buttons.getIconButton(()=>print("object1"),Icons.favorite),
          Buttons.getIconButton(()=>print("object2"),Icons.search),
          Buttons.getIconButton(()=>print("object3"),Icons.more_vert),
        ],
      );
}
