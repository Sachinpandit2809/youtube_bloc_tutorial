import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youtube_bloc_tutorial/data/response/api_response.dart';
import 'package:youtube_bloc_tutorial/model/users_model/placeholder_user_model.dart';
import 'package:youtube_bloc_tutorial/repository/json_placeholder_user/json_placeholder_user_repository.dart';

part 'json_placeholder_user_event.dart';
part 'json_placeholder_user_state.dart';

class JsonPlaceholderUserBloc
    extends Bloc<JsonPlaceholderUserEvent, JsonPlaceholderUserState> {
  JsonPlaceholderUserRepository jsonPlaceholderUserRepository;
  // providing the initial api Response status
  JsonPlaceholderUserBloc({required this.jsonPlaceholderUserRepository})
      : super(JsonPlaceholderUserState(userData: ApiResponse.loading())) {
    on<fetchUserDataEvent>(_onFetchUserDataEvent);
  }
  void _onFetchUserDataEvent(
      fetchUserDataEvent event, Emitter<JsonPlaceholderUserState> emit) async {
        await jsonPlaceholderUserRepository.fetchUserData().then((value) {
      emit(state.copyWith(userData: ApiResponse.completed(value)));
    }).onError(
      (error, stackTrace) {
        emit(state.copyWith(
            userData: ApiResponse.error(error.toString())));
      },
    );
      }

}
