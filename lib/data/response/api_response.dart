import 'package:youtube_bloc_tutorial/utils/enum.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? error;

  ApiResponse({this.status, this.data, this.error});
  ApiResponse.loading() : status = Status.LOADING;
    ApiResponse.completed(this.data) : status = Status.COMPLETED;
    ApiResponse.error(this.error) : status = Status.ERROR;
  
  @override
  String toString() {
    return 'ApiResponse{status: $status, data: $data, error: $error}';
  }

}
