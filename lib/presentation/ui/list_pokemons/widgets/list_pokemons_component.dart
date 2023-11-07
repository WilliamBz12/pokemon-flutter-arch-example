import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import 'pokemon_widget.dart';

class ListPokemonComponent extends StatelessWidget {
  const ListPokemonComponent({
    super.key,
    required this.data,
  });

  final List<Pokemon> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const Key('data'),
      itemCount: data.length,
      itemBuilder: (context, index) => PokemonWidget(item: data[index]),
    );
  }
}
