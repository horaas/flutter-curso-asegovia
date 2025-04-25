
import 'package:band_names_app/models/band_model.dart';

class BandsMapper {
  static List<BandModel> castToBandModel(List<dynamic> data) => data.map((json) => BandModel.fromJson(json)).toList() ;
}

