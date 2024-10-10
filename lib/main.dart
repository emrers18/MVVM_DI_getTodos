import 'package:flutter/material.dart';
import 'package:mvvm/core/di/injection.dart';
import 'app.dart';

void main() {
  configureDependencies();
  runApp(const App());
}


