import 'package:mongo_dart/mongo_dart.dart';

class DatabaseConn {
  Future<dynamic> connect() async {
    var db = Db('mongodb://localhost:27017/dart-api');
    await db.open();

    return db;
  }
}
