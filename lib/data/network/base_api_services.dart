abstract class BaseApiServices {
  Future<dynamic> getApi(String url);
  Future<dynamic> postApi(String url, var body);
  // Future<dynamic> putApi(String url, var body);
  // Future<dynamic> deleteApi(String url, var body);
}
