import 'general.dart';
import 'dart:convert';
import '../models/users.dart';

class Register extends General {
  @override
  void get(r) {
    Map<String, dynamic> res = {
      'resCode': 200,
      'resMessage': 'Register API Ready'
    };

    return r.response.write(jsonEncode(res));
  }

  @override
  void post(r) async {
    if (!super.header(r)) {
      super.defaultResponse(r, 'Please Using JSON Data');
    } else {
      try {
        String content = await utf8.decoder.bind(r).join();
        Map<String, dynamic> data = jsonDecode(content);

        Map<String, dynamic> body = {
          'username': data['username'],
          'email': data['email'],
          'password': data['password']
        };

        List validate = super.validateData(body);

        if (!validate[0]) {
          super.defaultResponse(r, validate[1]);
        } else {
          UserModel users = UserModel();
          var result = await users.insert(body);

          if (result) {
            super.defaultResponse(r, 'Register Success');
          } else {
            super.defaultResponse(r, 'Register Failed');
          }
        }
      } catch (e) {
        print(e);
      }
    }

    r.response.close();
  }

  @override
  void put(r) {
    return null;
  }

  @override
  void delete(r) {
    return null;
  }
}
