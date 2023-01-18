import 'package:band_names/services/socket_server.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SocketService socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Status', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: (socketService.serverStatus == ServerStatus.online)
                ?  Icon(Icons.check_circle, color: Colors.blue[300])
                : const Icon(Icons.offline_bolt, color: Colors.red),
          )
        ],
      ),
      body: Center(
        child: Text('Status Page: ${socketService.serverStatus} ',
            style: const TextStyle(fontSize: 20)),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () {
          socketService.socket.emit('send-message',
              {'nombre': 'Flutter', 'mensaje': 'Hola desde Flutter'});
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
