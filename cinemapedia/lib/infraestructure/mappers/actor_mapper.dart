import 'package:cinemapedia/configs/configs.dart';
import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/infraestructure/infraestructure.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath:
        cast.profilePath != null
            ? Environment.urlImageMovie + cast.profilePath!
            : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973461_640.png',
    character: cast.character!,
  );
}
