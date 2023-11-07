import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/domain.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget({super.key, required this.item});
  final Pokemon item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
    );
  }
}
