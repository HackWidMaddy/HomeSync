import 'package:flutter/material.dart';

class HomePageMain extends StatefulWidget {
  const HomePageMain({super.key});

  @override
  State<HomePageMain> createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('add a device'),
      ),
    );
  }
}
