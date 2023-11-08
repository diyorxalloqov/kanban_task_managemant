import 'package:flutter_dotenv/flutter_dotenv.dart';

class Server {
  // server
  static final String server1 = dotenv.get("server");
  static final String server = "http://138.68.109.195";

  //receive Timeout
  static const int receiveTimeout = 50;

  // connection  Timeout
  static const int connectionTimeout = 50;

  // send Timeout
  static const int sendTimeout = 50;
}
