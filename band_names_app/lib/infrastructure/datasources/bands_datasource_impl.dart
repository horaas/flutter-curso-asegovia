import 'package:band_names_app/models/band_model.dart';
import 'package:dio/dio.dart';
import 'package:band_names_app/domain/datasources/bands_datasource.dart';

class BandsDatasourceImpl extends BandsDatasource {
  final _dio = Dio(
    BaseOptions(baseUrl: 'https://noted-oyster-in.ngrok-free.app'),
  );


  BandsDatasourceImpl() {
  }

  @override
  Future<List<BandModel>> getBands() async {
    return [];
  }

  @override
  Future<void> updateVotesBands() {
    // TODO: implement updateVotesBands
    throw UnimplementedError();
  }
}
