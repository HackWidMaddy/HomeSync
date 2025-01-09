import 'package:flutter/material.dart';
import 'package:homesync/pages/route_generator.dart';
import 'package:homesync/pages/slapsh_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homesync',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Flashscreen(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
} 
