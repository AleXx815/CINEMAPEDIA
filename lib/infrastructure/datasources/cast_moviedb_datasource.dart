import 'package:cinemapadia/domain/datasources/cast_datasource.dart';
import 'package:cinemapadia/domain/entities/cast.dart';
import 'package:cinemapadia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapadia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

import '../../config/constants/environment.dart';

class CastMovieDbDatasource extends CastDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": Environment.theMovieDbKey,
        "language": "es-MX",
      },
    ),
  );

  @override
  Future<List<Cast>> getCastByMovie(String movieId) async {
    final response = await dio.get("/movie/$movieId/credits");

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Cast> cast = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return cast;
  }
}
