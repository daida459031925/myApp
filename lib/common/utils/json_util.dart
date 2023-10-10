import 'dart:convert';

class JsonUtils {
  static String encodeToJson(dynamic object) {
    return json.encode(object);
  }

  static T decodeFromJson<T>(String jsonStr) {
    return json.decode(jsonStr);
  }

}


