import 'package:flutter/cupertino.dart';

//全局异常工具类
class GlobalUtil {

  static GlobalUtil? _globalUtil ;

  GlobalUtil._();

  static GlobalUtil? getGlobalUtil() {
    _globalUtil ??= GlobalUtil._();
    return _globalUtil;
  }

  GlobalUtil setupErrorHandling() {
    FlutterError.onError = (FlutterErrorDetails details) {
      _handleGlobalError(details.exception);
    };
    return this;
  }

  void _handleGlobalError(dynamic exception) {
    // 在这里处理异常，比如打印日志、上报错误等
    print('Global error handler: $exception');
  }

}
