import 'dart:convert';
import 'dart:io';

class General {
  void get(HttpRequest r) {}

  void post(HttpRequest r) {}

  void put(HttpRequest r) {}

  void delete(HttpRequest r) {}

  bool header(HttpRequest r) {
    ContentType contentType = r.headers.contentType;

    if (contentType?.mimeType != 'application/json') {
      return false;
    }

    return true;
  }

  List<dynamic> validateData(Map d) {
    bool status = true;
    String message = '';

    for (String key in d.keys) {
      dynamic value = d[key];
      if (value.toString().isEmpty || value == null) {
        status = false;
        message = "$key cannot be empty";
        break;
      }
    }

    List res = [status, message];

    return res;
  }

  void defaultResponse(HttpRequest r, String c) {
    Map<String, dynamic> res = {'resCode': 200, 'resMessage': c};

    r.response.write(jsonEncode(res));
  }
}
