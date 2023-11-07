import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon_app/presentation/presentation.dart';

import '../mocks/mock_load_pokemons.dart';

void main() {
  group('ListPokemonsCubit', () {
    late ListPokemonsCubit cubit;

    setUp(() {
      cubit = ListPokemonsCubit(usecase: MockLoadPokemons());
    });

    blocTest<ListPokemonsCubit, ListPokemonState>(
      'should emits success state when usecase has answer',
      build: () {
        when(() => cubit.usecase.call())
            .thenAnswer((_) async => MockLoadPokemons.successData);
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<LoadingListPokemonState>(),
        isA<SuccessListPokemonState>(),
      ],
    );

    blocTest<ListPokemonsCubit, ListPokemonState>(
      'should emits error state when usecase throws a Http Error',
      build: () {
        when(() => cubit.usecase.call()).thenThrow(MockLoadPokemons.httpError);
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<LoadingListPokemonState>(),
        isA<ErrorListPokemonState>(),
      ],
    );

    blocTest<ListPokemonsCubit, ListPokemonState>(
      'should emits error state when usecase throws any error',
      build: () {
        when(() => cubit.usecase.call()).thenThrow(MockLoadPokemons.exception);
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<LoadingListPokemonState>(),
        isA<ErrorListPokemonState>(),
      ],
    );
  });
}
