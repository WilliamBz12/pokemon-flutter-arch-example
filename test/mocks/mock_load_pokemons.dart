import 'package:mocktail/mocktail.dart';
import 'package:pokemon_app/domain/domain.dart';

class MockLoadPokemons extends Mock implements LoadPokemons {
  static const successData = [Pokemon(url: '', name: 'Pikachu')];
  static final httpError = UnathenticatedHttpError();
  static final exception = Exception('Some unexpected error');
}
