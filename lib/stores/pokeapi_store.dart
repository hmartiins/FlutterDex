import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterdex/consts/consts_api.dart';
import 'package:flutterdex/models/pokeAPI.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeAPI pokeAPI;

  @action
  fetchPokemonList() {
    pokeAPI = null;
    loadPokeAPI().then((pokeList) {
      pokeAPI = pokeList;
    });
  }

  @action
  getPokemon({int index}){
    return pokeAPI.pokemon[index];
  }

  Future<PokeAPI> loadPokeAPI() async {
    try {
      final response = await http.get(ConstsAPI.pokeApiUrl);
      var decodeJson = jsonDecode(response.body);

      return PokeAPI.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print(error);
      print("Error on load the list" + stacktrace.toString());
      
      return null;
    }
  }

  Widget getImage({String number}){
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl:
        'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }
}
