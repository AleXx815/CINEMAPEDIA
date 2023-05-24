import 'package:cinemapadia/domain/entities/cast.dart';
import 'package:cinemapadia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Cast castToEntity(Actor cast) => Cast(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
            ? "https://image.tmdb.org/t/p/w500${cast.profilePath}"
            : "https://www.truckeradvisor.com/media/uploads/profilePics/notFound.jpg",
        character: cast.character,
      );
}
