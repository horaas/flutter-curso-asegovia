import 'package:dio/dio.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';

class PokemonsDatasourceImpl implements PokemonsDartasource {
  Dio dio;

  PokemonsDatasourceImpl()
    : dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));
  @override
  Future<(PokemonEntity?, String)> getPokenDescription(String id) async {
    try {
      final response = await dio.get('pokemon/$id');
      final pokemon = PokmeonMapper.pokeApiPokemonResponseToEntity(response.data);

      return (pokemon, 'succes');
      
    } catch (e) {
      return (null, 'error ocurrido $e');
    }
  }
}
