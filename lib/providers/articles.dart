import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/network/custom_exception.dart';

import 'package:newsapp/network/services/get_articles.dart';

class Articles extends ChangeNotifier {
  String _category = 'Top Headlines';
  List<Article> _articles = [];

  Map<String, List<Article>> _cache = {};

  GetArticles _getArticles = GetArticles();

  List<Article> get articles => [..._articles];
  String get category => _category;

  Future<void> updateCategory(String category) async {
    _category = category;
    _articles = [];
    notifyListeners();
    await fetchData(_category);
  }

  Future<void> fetchData([String category]) async {
    try {
      if (_cache.containsKey(category)) {
        _articles = _cache[category];
        notifyListeners();
      } else {
        if (category == 'Top Headlines') category = null;
        _articles = await _getArticles.getArticles(queryParameters: {
          'language': 'en',
          'category': category == null ? category : category.toLowerCase()
        });
        notifyListeners();
        print(_cache);
        _cache[_category] = _articles;
      }
    } on CustomException catch (err) {
      print('err.message 2');
      throw err.message;
    } catch (err) {
      throw err;
    }
  }
}

class SearchArticles extends ChangeNotifier {
  bool _isSearching = false;
  List<Article> _articles = [];

  GetArticles _getArticles = GetArticles();

  List<Article> get articles => [..._articles];
  bool get isSearching => _isSearching;

  Future<void> fetchData(String searchKey) async {
    try {
      _articles = [];
      _isSearching = true;
      notifyListeners();
      _articles = await _getArticles.getArticles(
        queryParameters: {
          'language': 'en',
          'q': searchKey,
        },
      );
      // _isSearching = false;
      // notifyListeners();
    } on CustomException catch (err) {
      throw err;
    } catch (err) {
      throw err;
    } finally {
      _isSearching = false;
      notifyListeners();
    }
  }
}

class SavedArticles extends ChangeNotifier {
  List<Article> _articles = [];

  List<Article> get articles => [..._articles];

  void saveArticle(Article article) {
    _articles.add(article);
    notifyListeners();
  }

  void removeArticle(Article article) {
    int index = _articles.indexOf(article);
    _articles.removeAt(index);
    notifyListeners();
  }
}
