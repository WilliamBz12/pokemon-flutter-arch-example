import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon_app/presentation/presentation.dart';

import '../mocks/mock_load_pokemons.dart';

void main() {
  group('ListPokemonsPage Widget Test', () {
    late ListPokemonsCubit presenter;
    late MockLoadPokemons usecase;

    setUp(() {
      usecase = MockLoadPokemons();
      presenter = ListPokemonsCubit(usecase: usecase);
    });

    testWidgets('should emits loading and then success widgets',
        (WidgetTester tester) async {
      when(() => presenter.usecase.call())
          .thenAnswer((_) async => MockLoadPokemons.successData);
      await tester.pumpWidget(
          MaterialApp(home: ListPokemonsPage(presenter: presenter)));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump();
      expect(find.byKey(const Key('data')), findsOneWidget);
    });

    testWidgets('should emits error widget', (WidgetTester tester) async {
      when(() => presenter.usecase.call())
          .thenThrow((_) async => MockLoadPokemons.httpError);

      await tester.pumpWidget(
          MaterialApp(home: ListPokemonsPage(presenter: presenter)));
      await tester.pump();
      expect(find.byKey(const Key('error')), findsOneWidget);
    });
  });
}
