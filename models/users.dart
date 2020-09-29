import './general.dart';
import '../db.dart';

class UserModel extends General {
  @override
  Future<bool> insert(Map d) async {
    DatabaseConn conn = new DatabaseConn();
    var db = await conn.connect();
    var coll = db.collection('users');
    try {
      var res = await coll.insertAll([
        {
          'username': d['username'],
          'email': d['email'],
          'password': d['password']
        }
      ]);

      if (res['err'] != null) {
        return false;
      }
    } catch (e) {
      print(e);
    }

    return true;
  }
}
