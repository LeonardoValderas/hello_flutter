import 'package:flutter/material.dart';
import 'package:hello_flutter/app.dart';
import 'package:hello_flutter/di.dart';

Future<void> main() async {
  await initDI();
  runApp(const App());
}
