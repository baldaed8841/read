import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_reader/data/repositories/random_article_repository.dart';

class ArticleState {}

class ArticleInitial {}

class ArticleCubit extends Cubit<ArticleState> {
  final _repo = RandomArticleRepository();
  ArticleCubit() : super(_);
  void updateArticle(){
    
  }
}
