import 'package:flutter/material.dart';

class secPage extends StatefulWidget {
  @override
  _secPageState createState() => _secPageState();
}

class _secPageState extends State<secPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.black12,
            )),
      ),
    );
  }
}