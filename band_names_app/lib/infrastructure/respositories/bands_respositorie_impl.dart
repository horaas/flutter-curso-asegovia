
import 'package:band_names_app/domain/datasources/bands_datasource.dart';
import 'package:band_names_app/domain/respositories/bands_respositorie.dart';
import 'package:band_names_app/models/band_model.dart';

class BandsRespositorieImpl extends BandsRespositorie {
  final BandsDatasource bandsDatasource;
  
  BandsRespositorieImpl(this.bandsDatasource);

  @override
  Future<List<BandModel>> getBands() {
    return bandsDatasource.getBands();
  }

  @override
  Future<void> updateVotesBands() {
    // TODO: implement updateVotesBands
    throw UnimplementedError();
  }
  
}