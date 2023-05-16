import 'package:cinemapadia/domain/entities/movie.dart';
import 'package:cinemapadia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifer, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifer(getMovie: movieRepository.getMovieById);
});

/*
VOY A CREAR UN MAPA
{
  key(se muestre el id de la película): Movie()(se muestre la instancia de la película),
}


*/
typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifer extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifer({
    required this.getMovie,
  }) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    print("Realizando petición http");
    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
