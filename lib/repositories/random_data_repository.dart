import 'package:wiki_reader/data/repositories/random_article.dart';
import 'package:wiki_reader/summary.dart';

class RandomDataRepository {
  final RandomDataRepository service = RandomArticleService();
  Summary getRandomArticle() async {
    final data = await service.fetchRandomArticle();
    return Summary.fromJson(data);
  }
}
