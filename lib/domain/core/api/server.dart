import 'package:flutter_dotenv/flutter_dotenv.dart';

class Server {
  // server
  static final String server = dotenv.get("server");

  //receive Timeout
  static const int receiveTimeout = 50;

  // connection  Timeout
  static const int connectionTimeout = 50;

  // send Timeout
  static const int sendTimeout = 50;
}
