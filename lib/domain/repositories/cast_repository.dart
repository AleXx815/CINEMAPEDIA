import 'package:cinemapadia/domain/entities/cast.dart';

abstract class CastRepository {
  Future<List<Cast>> getCastByMovie(String movieId);
}
