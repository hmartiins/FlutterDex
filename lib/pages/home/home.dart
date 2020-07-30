import 'package:flutter/material.dart';
import 'package:flutterdex/consts/consts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image.asset(ConstsApp.whitePokeball),
        ],
      ),
    );
  }
}
