import 'package:bloc/bloc.dart';

import 'state.dart';

abstract class ListPokemonPresenter extends Cubit<ListPokemonState> {
  ListPokemonPresenter(super.initialState);
  void load();
}
