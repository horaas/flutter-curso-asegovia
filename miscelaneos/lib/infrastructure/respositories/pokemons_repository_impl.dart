
import 'package:miscelaneos/domain/domain.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsDartasource datasource;

  PokemonsRepositoryImpl(this.datasource);
  @override
  Future<(PokemonEntity?, String)> getPokenDescription(String id) {
    return datasource.getPokenDescription(id);
  }
  
}