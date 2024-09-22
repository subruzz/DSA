import 'dart:isolate';

void _getMessages(SendPort sp) async {
  await for (var now in Stream.periodic(
      Duration(seconds: 1), (_) => DateTime.now().toIso8601String())) {
    sp.send(now);
  }
}

Stream<String> getMessages() {
  final rp = ReceivePort();
  final foo = Isolate.spawn(_getMessages, rp.sendPort)
      .asStream()
      .asyncExpand((_) => rp)
      .takeWhile((element) => element is String)
      .cast<String>();
  return foo;
}

void main() async {
  await for (var msg in getMessages()) {
    print(msg);
  }
}
