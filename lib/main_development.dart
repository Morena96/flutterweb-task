import 'package:flutter/material.dart';
import 'package:supono/app.dart';
import 'package:supono/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(() => const App());
}
