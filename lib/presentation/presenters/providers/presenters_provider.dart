import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/data/data.dart';

import '../../presentation.dart';

class PresentersProvider {
  static final listPokemonPresenter = Provider<ListPokemonPresenter>(
    (ref) => ListPokemonsCubit(
      usecase: ref.read(DataProviders.remoteLoadPokemonsProvider),
    ),
  );
}
