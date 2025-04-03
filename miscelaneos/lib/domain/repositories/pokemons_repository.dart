
import 'package:miscelaneos/domain/domain.dart';

abstract class PokemonsRepository {
    Future<(PokemonEntity?, String)> getPokenDescription(String id);
}