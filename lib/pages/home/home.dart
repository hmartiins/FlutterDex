import 'package:flutter/material.dart';
import 'package:flutterdex/consts/consts.dart';
import 'package:flutterdex/pages/home/widgets/app_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(200 / 4.5),
            left: (screenWidth - (200 / 1.6)),
            child: Opacity(
              child: Image.asset(
                ConstsApp.whitePokeball,
                height: 200,
                width: 200,
              ),
              opacity: 0.2,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusBar,
                ),
                AppBarHome(),
                Expanded(
                  child: ListView(
                    children: <Widget>[ListTile(title: Text("Pokemon"))],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
