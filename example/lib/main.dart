import 'package:flutter/material.dart';
import 'package:kdproxy/kdproxy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _kdproxyPlugin = Kdproxy();

  @override
  void initState() {
    super.initState();
    Kdproxy.getProxy.then((value) {
      setState(() {
        _platformVersion = 'ProxySetting: ${value?.host}:${value?.port}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
