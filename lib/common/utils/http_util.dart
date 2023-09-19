import 'package:dio/dio.dart';

import 'package:my_app/common/utils/err_util.dart';

//网络请求工具 返还值可能是null
class HttpUtil<T> {
  late Dio _dio;
  late String _path;
  late String errReq = "请求失败";
  late String errPath = "传入路径不能为空";

  HttpUtil(String path) {
    _dio = Dio();
    setPath(path);
  }

  setPath(String path){
    if (path.isEmpty) {
      ErrUtil.err(errPath);
    }
    _path = path;
    return this;
  }

  Future<Response> _get() async => await _dio.get(_path);

  Future<Response> _post(dynamic data) async =>
      await _dio.post(_path, data: data);

  Future<Response> _put(dynamic data) async =>
      await _dio.put(_path, data: data);

  Future<Response> _patch(dynamic data) async =>
      await _dio.patch(_path, data: data);

  Future<Response> _delete() async => await _dio.delete(_path);

  Future<Response> _download(String savePath) async =>
      await _dio.download(_path, savePath);

  Future<Response> _head() async => await _dio.head(_path);

  Future<T> _future(Response response) {
    if (response.statusCode == 200) {
      return Future.value(response.data as T);
    } else {
      ErrUtil.err("请求失败");
    }
    return Future.value();
  }

  Future<T> getData() async => _future(await _get());

  Future<T> postData(dynamic data) async => _future(await _post(data));

  Future<T> putData(dynamic data) async => _future(await _put( data));

  Future<T> patchData(dynamic data) async => _future(await _patch( data));

  Future<T> deleteData() async => _future(await _delete());

  Future<T> downloadData(String savePath) async =>
      _future(await _download(savePath));

  Future<T> headData() async => _future(await _head());




  Future<Response> uploadFile(String filePath) async {

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
    });

    return _post(formData);
  }

  Future<Response> uploadFiles(List<String> filePaths) async {

    List<MultipartFile> files = [];
    for (String filePath in filePaths) {
      files.add(await MultipartFile.fromFile(filePath));
    }

    FormData formData = FormData.fromMap({
      'files': files,
    });

    return _post(formData);
  }

}
