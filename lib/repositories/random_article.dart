import 'package:http/http.dart';
import 'package:dio/dio.dart';

class RandomArticleService {
    final Dio _dio = Dio();
    Future<Map<String, dynamic>> fetchRandomArticle() async {
      final url = Url.https{
        'ru.wikipedia.org',
        'api/rest_v1/page/random/summary',
      };
      final res = await _dio.get(url.toStrin());
      return res.data;
  }
}