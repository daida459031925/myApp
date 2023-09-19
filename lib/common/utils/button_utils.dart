import 'package:flutter/material.dart';

//静态方法的按钮样式
class Buttons {
  //图标按钮
  static IconButton getIconButton(Function f, IconData ico) => IconButton(
      onPressed: () {
        f();
      },
      icon: Icon(ico));

  //浮动按钮
  static FloatingActionButton getFloatingActionButton(
          Function f, IconData ico) =>
      FloatingActionButton(
          onPressed: () {
            f();
          },
          child: Icon(ico));
}
