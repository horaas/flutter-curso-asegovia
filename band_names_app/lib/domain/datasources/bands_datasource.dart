
import 'package:band_names_app/models/band_model.dart';

abstract class BandsDatasource {
  Future<List<BandModel>> getBands();
  Future<void> updateVotesBands();
}