import 'package:cinemapadia/infrastructure/datasources/cast_moviedb_datasource.dart';
import 'package:cinemapadia/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final castRepositoryProvider = Provider(
  (ref) {
    return CastRepositoryImpl(
      CastMovieDbDatasource(),
    );
  },
);
