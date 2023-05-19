import 'package:cinemapadia/domain/entities/cast.dart';

abstract class CastDatasource {
  Future<List<Cast>> getCastByMovie(String movieId);
}
