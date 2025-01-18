part of 'json_placeholder_user_bloc.dart';


class JsonPlaceholderUserState extends Equatable {
final ApiResponse<List<PlaceholderUserModel>> userData;
  const  JsonPlaceholderUserState(
   {  required this.userData}
  );
  JsonPlaceholderUserState copyWith({
    ApiResponse<List<PlaceholderUserModel>>? userData,
  }) {
    return JsonPlaceholderUserState(
      userData: userData ?? this.userData,
    );
  }

  @override
  List<Object> get props => [userData];
}

