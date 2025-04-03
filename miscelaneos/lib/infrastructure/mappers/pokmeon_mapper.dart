
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';

class PokmeonMapper {

  static PokemonEntity pokeApiPokemonResponseToEntity(Map<String, dynamic>json) {
    final modelAPi = PokeApiPokemonResponse.fromJson(json);
    return PokemonEntity(name: modelAPi.name, front: modelAPi.sprites.frontDefault, id: modelAPi.id);
  }
}