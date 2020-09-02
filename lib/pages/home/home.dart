import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutterdex/consts/consts.dart';
import 'package:flutterdex/models/pokeAPI.dart';
import 'package:flutterdex/pages/home/widgets/app_bar.dart';
import 'package:flutterdex/stores/pokeapi_store.dart';

import 'widgets/poke_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PokeApiStore pokeApiStore;

  @override
  void initState() {
    super.initState();
    pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokemonList();
  }

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
                  child: Container(
                    child: Observer(builder: (BuildContext context) {
                      PokeAPI pokeAPI = pokeApiStore.pokeAPI;
                      return (pokeApiStore.pokeAPI != null)
                        ? AnimationLimiter(
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(12),
                            addAutomaticKeepAlives: false,
                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,),
                            itemCount:
                                pokeApiStore.pokeAPI.pokemon.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration:
                                    const Duration(milliseconds: 375),
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: GestureDetector(
                                    child: PokeItem(),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                        (BuildContext context) =>
                                          Container(),
                                        fullscreenDialog: true,
                                      ));
                                    },
                                  ),
                                ),
                              );
                            }),
                          )
                        : Center(
                          child: CircularProgressIndicator(),
                        );
                    }),
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
