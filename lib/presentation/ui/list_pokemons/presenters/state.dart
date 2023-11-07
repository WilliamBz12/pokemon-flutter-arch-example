import 'package:pokemon_app/domain/domain.dart';

abstract class ListPokemonState {}

class InitialListPokemonState implements ListPokemonState {}

class LoadingListPokemonState implements ListPokemonState {}

class SuccessListPokemonState implements ListPokemonState {
  final List<Pokemon> data;
  const SuccessListPokemonState({required this.data});
}

class ErrorListPokemonState implements ListPokemonState {
  final String errorMessage;
  const ErrorListPokemonState({required this.errorMessage});
}
