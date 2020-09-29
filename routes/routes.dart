import 'dart:io';
import '../controllers/register.dart';
import 'dart:convert';

class Routes {
  // @param r HttpRequest object
  // @param u Request Method
  // @param o Instance of controller
  void mapMethod(HttpRequest r, String u, dynamic o) {
    if (u == 'get') {
      if (!requestMethod(r, 1)) {
        defaultResponse(r, 'Method not allowed');
      } else {
        o.get(r);
      }
    } else if (u == 'post') {
      if (!requestMethod(r, 1)) {
        defaultResponse(r, 'Method not allowed');
      } else {
        o.post(r);
      }
    } else if (u == 'put') {
      if (!requestMethod(r, 1)) {
        defaultResponse(r, 'Method not allowed');
      } else {
        o.put(r);
      }
    } else if (u == 'delete') {
      if (!requestMethod(r, 1)) {
        defaultResponse(r, 'Method not allowed');
      } else {
        o.delete(r);
      }
    } else {
      defaultResponse(r, 'Invalid Request');
    }
  }

  Routes(HttpRequest r) {
    String u = r.uri.path;
    List s = u.split('/');

    if (RegExp(r"^/register/*").hasMatch(u)) {
      // @route /register/
      // @access public
      // @desc Register API
      Register regisController = Register();
      mapMethod(r, s[2], regisController);
    } else {
      r.response.write('Invalid Request');
    }
  }

  bool requestMethod(HttpRequest request, int i) {
    List rm = ['POST', 'GET', 'PUT', 'DELETE'];

    if (request.method != rm[i]) {
      return false;
    }

    return true;
  }

  void defaultResponse(HttpRequest r, String s) {
    Map res = {'resCode': 403, 'resMessage': s};

    r.response.write(jsonEncode(res));
    r.response.close();
  }
}
