import 'package:band_names_app/models/band_model.dart';

abstract class BandsRespositorie {
  Future<List<BandModel>> getBands();
  Future<void> updateVotesBands();
}