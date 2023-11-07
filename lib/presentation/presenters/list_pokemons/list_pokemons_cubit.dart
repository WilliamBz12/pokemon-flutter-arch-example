import 'package:pokemon_app/domain/domain.dart';
import 'package:pokemon_app/presentation/presentation.dart';

class ListPokemonsCubit extends ListPokemonPresenter {
  ListPokemonsCubit({
    required this.usecase,
  }) : super(InitialListPokemonState());

  final LoadPokemons usecase;

  @override
  void load() async {
    emit(LoadingListPokemonState());
    try {
      final result = await usecase();
      emit(SuccessListPokemonState(data: result));
    } on HttpError catch (e) {
      if (e is UndefinedHttpError) {
        emit(
          const ErrorListPokemonState(
            errorMessage:
                'Erro indefinido ocorreu. Por favor, tente novamente mais tarde.',
          ),
        );
      } else if (e is UnathenticatedHttpError) {
        emit(
          const ErrorListPokemonState(errorMessage: 'Faça o login novamente.'),
        );
      } else if (e is ServerHttpError) {
        emit(
          const ErrorListPokemonState(
            errorMessage: 'ente novamente mais tarde.',
          ),
        );
      } else if (e is SocketHttpError) {
        emit(
          const ErrorListPokemonState(
            errorMessage: 'Verifique sua conexão e tente novamente.',
          ),
        );
      } else {
        emit(
          const ErrorListPokemonState(
            errorMessage: 'Ocorreu um erro inesperado.',
          ),
        );
      }
    } catch (e) {
      emit(
        const ErrorListPokemonState(
          errorMessage: 'Ocorreu um erro inesperado.',
        ),
      );
    }
  }
}
