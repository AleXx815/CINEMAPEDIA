import 'package:cinemapadia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapadia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable
// Proporciona a los demás providers la información necesaria
// Para consultar la informacion del repositoryImpl
final movieRepositoryProvider = Provider(
  (ref) {
    return MovieRepositoryImpl(
      MoviedbDatasource(),
    );
  },
);
