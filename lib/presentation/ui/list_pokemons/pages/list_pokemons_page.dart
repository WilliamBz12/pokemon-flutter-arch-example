import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation.dart';
import '../widgets/list_pokemons_component.dart';

class ListPokemonsPage extends StatefulWidget {
  const ListPokemonsPage({super.key, required this.presenter});

  final ListPokemonPresenter presenter;

  @override
  State<StatefulWidget> createState() => _ListPokemonsPageState();
}

class _ListPokemonsPageState extends State<ListPokemonsPage>
    with ListPokemonsMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
      ),
      body: Center(
        child: BlocBuilder<ListPokemonPresenter, ListPokemonState>(
          bloc: widget.presenter,
          builder: (context, state) {
            if (state is LoadingListPokemonState) {
              return const CircularProgressIndicator();
            } else if (state is ErrorListPokemonState) {
              return Text(
                state.errorMessage,
                key: const Key('error'),
              );
            } else if (state is SuccessListPokemonState) {
              return ListPokemonComponent(data: state.data);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
