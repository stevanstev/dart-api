import 'dart:io';
import './routes/routes.dart';

void main() async {
  HttpServer.bind(InternetAddress.loopbackIPv4, 4040).then((server) {
    InternetAddress s = server.address;
    print("Server Running on: ${s.address} and port 4040");
    server.listen((HttpRequest request) {
      Routes(request);
    });
  });
}
