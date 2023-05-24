import 'package:cinemapadia/domain/datasources/cast_datasource.dart';
import 'package:cinemapadia/domain/entities/cast.dart';
import 'package:cinemapadia/domain/repositories/cast_repository.dart';

class CastRepositoryImpl extends CastRepository {
  final CastDatasource datasource;

  CastRepositoryImpl(this.datasource);

  @override
  Future<List<Cast>> getCastByMovie(String movieId) {
    return datasource.getCastByMovie(movieId);
  }
}
