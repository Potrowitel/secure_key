import 'package:flutter/material.dart';
import 'package:secure_key/secure_key.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _secureKeyPlugin = SecureKey();

  int? level;

  List<String> llll = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () async {
                  try {
                    var result = await _secureKeyPlugin.initialize();
                    print('INIT:$result');
                  } catch (e) {
                    print('INIT:\n $e');
                  }
                },
                child: const Text('INIT')),
            const SizedBox(height: 16),
            OutlinedButton(
                onPressed: () async {
                  try {
                    var result = await _secureKeyPlugin.createPairKey();
                    print('Create:$result');
                  } catch (e) {
                    print('Create:\n$e');
                  }
                },
                child: const Text('Create')),
            const SizedBox(height: 16),
            OutlinedButton(
                onPressed: () async {
                  try {
                    var result = await _secureKeyPlugin.deleteKey();
                    print('DELETE:$result');
                  } catch (e) {
                    print('DELETE:\n$e');
                  }
                },
                child: const Text('DELETE')),
            const SizedBox(height: 16),
            OutlinedButton(
                onPressed: () async {
                  try {
                    var result = await _secureKeyPlugin.getPublicKey();
                    print('GET:$result');
                  } catch (e) {
                    print('GET:\n$e');
                  }
                },
                child: const Text('Get key')),
            const SizedBox(height: 16),
            OutlinedButton(
                onPressed: () async {
                  try {
                    var result = await _secureKeyPlugin.signSha256('1234');
                    print('SIGN:$result');
                  } catch (e) {
                    print('SIGN:\n$e');
                  }
                },
                child: const Text('Sign sha 256')),
          ],
        ),
      ),
    );
  }
}
//