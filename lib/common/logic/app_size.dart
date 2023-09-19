import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///屏幕适配工具类
abstract class AppSize {
  ///初始化屏幕宽高
  static void init(BuildContext context, double width, double height) =>
      ScreenUtil.init(context, designSize: Size(width, height));

  ///设置容器宽度
  static double setWidth(double width) => ScreenUtil().setWidth(width);

  ///设置容器高度
  static double setHeight(double height) => ScreenUtil().setHeight(height);

  ///设置字体大小
  static double setSp(double value) => ScreenUtil().setSp(value);

  //获取屏幕宽度
  static double getWidth() => ScreenUtil().screenWidth;

  ///获取屏幕高度
  static double getHeight() => ScreenUtil().screenHeight;

  ///获取像素点密度
  static double? getPixel() => ScreenUtil().pixelRatio;

  ///获取状态栏高度
  static double getStatusBarHeight() => ScreenUtil().statusBarHeight;

  ///获取滴鼻导航栏高度
  static double getBottomBarHeight() => ScreenUtil().bottomBarHeight;


}