import 'package:cinemapadia/domain/entities/cast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cast_repository_provider.dart';

final castByMovieProvider =
    StateNotifierProvider<CastByMovieNotifier, Map<String, List<Cast>>>((ref) {
  final castRepository = ref.watch(castRepositoryProvider);
  return CastByMovieNotifier(getCast: castRepository.getCastByMovie);
});

/*
VOY A CREAR UN MAPA
{
  key(se muestre el id de la película): List<Cast>(se muestre la instancia de la película),
}


*/
typedef GetCastCallback = Future<List<Cast>> Function(String movieId);

class CastByMovieNotifier extends StateNotifier<Map<String, List<Cast>>> {
  final GetCastCallback getCast;

  CastByMovieNotifier({
    required this.getCast,
  }) : super({});

  Future<void> loadCast(String movieId) async {
    if (state[movieId] != null) return;
    final List<Cast> cast = await getCast(movieId);

    state = {...state, movieId: cast};
  }
}
