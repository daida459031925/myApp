import 'package:flutter/material.dart';

import '../utils/button_utils.dart';


//底部通用内容
class Foot {

  static BottomAppBar getBottomNavigationBar() => BottomAppBar(
    child: Row(
      children: [
        Buttons.getIconButton(()=>print("object1"),Icons.menu),
        Buttons.getIconButton(()=>print("object2"),Icons.keyboard_command_key_outlined),
        const Spacer(),
        Buttons.getIconButton(()=>print("object3"),Icons.search),
        Buttons.getIconButton(()=>print("object4"),Icons.more_vert),
      ],
    ),
  );


}