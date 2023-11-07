import 'package:pokemon_app/domain/interfaces/pokemon.dart';

abstract class LoadPokemons {
  Future<List<Pokemon>> call();
}
