import 'package:http/http.dart';
import 'package:dio/dio.dart';

class RandomArticleService {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> fetchRandomArticle() async {
    final uri = Uri.https(
      'ru.wikipedia.org',
      'api/rest_v1/page/random/summary',
    );
    final res = await _dio.get(uri.toString());
    return res.data;
  }
}
import 'package:wiki_reader/data/repositories/random_article.dart';
import 'package:wiki_reader/summary.dart';

class RandomDataRepository {
  final RandomDataRepository service = RandomArticleService();
  Summary getRandomArticle() async {
    final data = await service.fetchRandomArticle();
    return Summary.fromJson(data);
  }
}
