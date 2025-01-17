import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youtube_bloc_tutorial/data/response/api_response.dart';
import 'package:youtube_bloc_tutorial/model/movies/movies.dart';
import 'package:youtube_bloc_tutorial/model/movies/movies_models.dart';
import 'package:youtube_bloc_tutorial/repository/movies_repository/movies_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;
  // providing the initial api Response status
  MoviesBloc({required this.moviesRepository})
      : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<fetchMoviesList>(_onFetchMoviesList);
  }
  void _onFetchMoviesList(
      fetchMoviesList event, Emitter<MoviesState> emit) async {
    await moviesRepository.fetchMoviesApi().then((value) {
      emit(state.copyWith(moviesList: ApiResponse.completed(value)));
    }).onError(
      (error, stackTrace) {
        emit(state.copyWith(
            moviesList: ApiResponse.error(error.toString())));
      },
    );
  }
}
