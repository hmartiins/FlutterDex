import 'package:flutter/material.dart';
import 'package:flutterdex/consts/consts.dart';

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
            top: -(160 / 4.5),
            left: (screenWidth - (160 / 1.6)),
            child: Opacity(
              child: Image.asset(
                ConstsApp.whitePokeball,
                height: 160,
                width: 160,
              ),
              opacity: 0.2,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusBar,
                  // color: Colors.blueAccent,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 3),
                              child: IconButton(
                                  icon: Icon(Icons.menu), onPressed: () => {}),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 23),
                            child: Text(
                              'Pokedéx',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  height: 110,
                  color: (Color.fromARGB(200, 245, 215, 255)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
