import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/data/data.dart';
import 'package:pokemon_app/domain/usecases/load_pokemons.dart';

class DataProviders {
  static final apiClientProvider = Provider<Dio>((ref) {
    return ApiClientFactory.create('https://pokeapi.co/api/v2');
  });

  static final remoteLoadPokemonsProvider = Provider<LoadPokemons>((ref) {
    return RemoteLoadPokemons(client: ref.read(apiClientProvider));
  });
}
