import 'dart:convert';

import 'package:flutterdex/consts/consts_api.dart';
import 'package:flutterdex/models/pokeAPI.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeAPI pokeAPI;

  // @computed
  // PokeAPI get PokeAPI => pokeAPI;

  @action
  fetchPokemonList() {
    pokeAPI = null;
    loadPokeAPI().then((pokeList) {
      pokeAPI = pokeList;
    });
  }

  Future<PokeAPI> loadPokeAPI() async {
    try {
      final response = await http.get(ConstsAPI.pokeApiUrl);
      var decodeJson = jsonDecode(response.body);
      return PokeAPI.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print(error);
      print("Error on load the list");
      return null;
    }
  }
}
