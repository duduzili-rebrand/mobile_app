import 'package:web_socket_channel/web_socket_channel.dart' as ws;
import '../helpers/helpers.dart';
import 'iweb_socket.dart';

class WsChannelClient implements IWebSocket {
  @override
  late ws.WebSocketChannel socket;

  @override
  late Function(dynamic data) eventHandler;

  @override
  late String url;

  @override
  dynamic data;

  WsChannelClient(
      {required this.url, required this.eventHandler, Function()? onConnect}) {
    connect(onConnect);
  }

  @override
  void connect([connectParams]) async {
    socket = ws.WebSocketChannel.connect(Uri.parse(url));
    socket.ready.then((value) {
      socket.sink.add('{"time_view":"1D"}');
    });
    socket.stream.listen(
      (event) {
        eventHandler(event);
      },
      onDone: () => InternetConnectionChecker().hasConnection.then(
        (value) {
          if (!value) {
            try {
              connect();
            } catch (e) {}
          }
        },
      ),
    );
  }

  @override
  void onConnect() {}

  @override
  void close([closeParams]) => socket.sink.close(); // socket.close();

  @override
  void send([timeFrame]) =>
      socket.sink.add('{"time_view":"${timeFrame.toString()}"}');
}
