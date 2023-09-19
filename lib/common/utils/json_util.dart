import 'dart:convert';

class JsonUtils {
  static String encodeToJson(dynamic object) {
    return json.encode(object.toJson());
  }

  static T decodeFromJson<T>(String jsonStr) {
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
    return _fromJson<T>(jsonMap);
  }

  static T _fromJson<T>(Map<String, dynamic> json) {
    if (T == String) {
      return json as T;
    } else if (T == int) {
      return int.parse(json.toString()) as T;
    } else if (T == double) {
      return double.parse(json.toString()) as T;
    } else if (T == bool) {
      return (json.toString() == 'true') as T;
    } else if (T == Map) {
      return json as T;
    } else {
      return _fromJsonClass<T>(json);
    }
  }

  static T _fromJsonClass<T>(Map<String, dynamic> json) {
    if (_hasFromJsonMethod(T)) {
      T? t =  json['data'] != null ? _fromJson(json['data']) : null;
      return t as T;
    } else {
      throw Exception("Class $T does not implement fromJson method");
    }
  }

  static bool _hasFromJsonMethod<T>(Type type) {
    return T.toString() != "dynamic" && T.toString() != "Object"
        && T.toString() != "Map<dynamic, dynamic>"
        && T.toString() != "List<dynamic>";
  }

  static Map<String, dynamic> toMap(dynamic object) {
    return object.toJson();
  }

  static T fromMap<T>(Map<String, dynamic> map) {
    return _fromJson<T>(map);
  }
}


