part of 'movies_bloc.dart';

@freezed
abstract class MoviesEvent extends Equatable {
  
  List<Object> get props => [] ; 
}

class fetchMoviesList extends MoviesEvent {}