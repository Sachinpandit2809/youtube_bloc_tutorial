import 'package:http/http.dart' as http;
import 'package:youtube_bloc_tutorial/config/app_urls.dart';

void main() async {
  final res = await http.get(Uri.parse(AppUrls.movies_List));
  print(res.body);
}
