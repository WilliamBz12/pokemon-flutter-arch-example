import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokemon_app/data/data.dart';
import 'package:pokemon_app/domain/domain.dart';

class RemoteLoadPokemons implements LoadPokemons {
  final Dio client;
  RemoteLoadPokemons({required this.client});

  @override
  Future<List<Pokemon>> call() async {
    try {
      final result = await client.get('/pokemon');
      final data = result.data['results'] as List;
      return PokemonModel.fromList(data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnathenticatedHttpError();
      } else if (e.response?.statusCode == 500) {
        throw ServerHttpError();
      } else if (e.error is SocketException) {
        throw SocketHttpError();
      } else {
        throw UndefinedHttpError();
      }
    } catch (e) {
      throw UndefinedHttpError();
    }
  }
}
