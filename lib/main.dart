import 'package:flutter/material.dart';
import 'screens/hero_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Cards 3D',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: HeroListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
