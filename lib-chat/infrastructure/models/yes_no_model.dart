
import 'package:pelis_app/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  factory YesNoModel.getJsonParse(Map<String, dynamic> json) => 
  YesNoModel(
    answer: json['answer'],
    forced: json['forced'],
    image: json['image'],
  );

  Message getMessage() {
    return Message(text: answer == 'yes' ? 'Si' : 'No',
    fromWho: FromWho.her, imageUrl: image);
  }
}