import 'dart:isolate';

void main() {
  createIsolate();
}

createIsolate() async {
  ReceivePort rp = ReceivePort();
  Isolate.spawn(ourIsolate, rp.sendPort);
  SendPort chilsendPort = await rp.first;
  ReceivePort responce = ReceivePort();
  chilsendPort.send(['subru', responce.sendPort]);
  var r = await responce.first;
  print(r);
}

ourIsolate(SendPort sp) async {
  ReceivePort rps = ReceivePort();
  sp.send(rps.sendPort);
  await for (var m in rps) {
    String ul = m[0];
    SendPort reply = m[1];
    var response = await Future.delayed(Duration(seconds: 2), () {
      return ul;
    });
    //replace it with http req and then send
    reply.send(response);
  }
}
