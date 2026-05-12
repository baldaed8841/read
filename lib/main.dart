import 'package:flutter/material.dart';
import 'summary.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}

class ArticleModel {
  Future<Summary> getRandomArticle() async {
    final uri = Uri.https(
      'en.wikipedia.com',
      'api/rest_v1/page/random/summary',
    );
    final response = await get(uri);
    if (response.statusCode != 200) {
      throw HttpException("Failed to update resource");
    }
    return Summary.fromJson(json.decode(response.body) as Map<String, Object?>);
  }
}

class ArticleViewModel extends ChangeNotifier {
  final ArticleModel model;
  Summary? summary;
  Exception? error;
  bool isLoading = false;
  ArticleViewModel(this.model) {
    fetchArticle();
  }
  void fetchArticle() async {
    isLoading = true;
    notifyListeners();
    try {
      summary = await model.getRandomArticle();
      error = null;
    } on HttpException catch (e) {
      summary = null;
      error = e;
    }
    isLoading = false;
    notifyListeners();
  }
}

class ArticleWidget extends StatelessWidget {
  final Summary summary;
  const ArticleWidget({super.key, required this.summary});
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(8.0),
      child: Column(
        spacing: 10,
        children: [
          if (summary.hasImage) Image.network(summary.originalImage.source),
          Text(
            summary.tiles.normalized,
            overflow: TextOverflow.eclipsis,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          if (summary.description != null)
            Text(
              contextsummary.description!,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          Text(summary.extract),
        ],
      ),
    );
  }
}
