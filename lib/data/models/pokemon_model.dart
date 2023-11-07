import 'package:pokemon_app/domain/interfaces/pokemon.dart';

class PokemonModel {
  final Map<String, dynamic> data;

  PokemonModel({required this.data});

  Pokemon toEntity() {
    return Pokemon(name: data['name'], url: data['url']);
  }

  static List<Pokemon> fromList(List json) => json
      .map((e) => PokemonModel(
            data: e,
          ).toEntity())
      .toList();
}
