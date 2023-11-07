import 'package:flutter/material.dart';
import 'package:pokemon_app/presentation/ui/list_pokemons/pages/list_pokemons_page.dart';

mixin ListPokemonsMixin<T extends StatefulWidget> on State<ListPokemonsPage> {
  @override
  void initState() {
    super.initState();
    widget.presenter.load();
  }
}
