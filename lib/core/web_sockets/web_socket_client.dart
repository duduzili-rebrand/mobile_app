import 'package:web_socket_client/web_socket_client.dart';

import 'iweb_socket.dart';

class WebSocketClient implements IWebSocket {
  @override
  late WebSocket socket;

  @override
  late Function(dynamic data) eventHandler;

  @override
  late String url;

  @override
  dynamic data;

  WebSocketClient(
      {required this.url, required this.eventHandler, Function()? onConnect}) {
    connect(onConnect);
  }

  @override
  void connect([connectParams]) {
    socket = WebSocket(Uri.parse(url));
    if (connectParams != null) {
      socket.connection.listen((event) {
        if (event == Connected()) connectParams();
      });
    }
    socket.messages.listen((message) => eventHandler(message));
  }

  @override
  void onConnect() {}

  @override
  void close([closeParams]) => socket.close(); // socket.close();

  @override
  void send([message]) => socket.send(message);
}
