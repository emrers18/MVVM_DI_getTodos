import 'package:flutter/material.dart';
import 'presentation/presentation.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking',

      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const TodosView(),
    );
  }
}
