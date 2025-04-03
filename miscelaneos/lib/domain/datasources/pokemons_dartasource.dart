
import 'package:miscelaneos/domain/domain.dart';

abstract class PokemonsDartasource {
  // revisar bien el funcionamiento de este funcionamiento
  Future<(PokemonEntity?, String)> getPokenDescription(String id);
}