import 'package:dio/dio.dart';
import 'package:pelis_app/domain/entities/message.dart';
import 'package:pelis_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");
    final dataParse = YesNoModel.getJsonParse(response.data);

    return Message(text: dataParse.answer, fromWho: FromWho.her, imageUrl: dataParse.image);
  }
}