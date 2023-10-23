import 'package:flutter_dotenv/flutter_dotenv.dart';

class Server {
  // server
  static final String server = dotenv.get("server");
  static final String server1 = "http://192.168.42.197:8000";

  //receive Timeout
  static const int receiveTimeout = 50;

  // connection  Timeout
  static const int connectionTimeout = 50;

  // send Timeout
  static const int sendTimeout = 50;
}
