import 'dart:convert';

import 'package:newsapp/models/article.dart';
import 'package:newsapp/network/custom_exception.dart';
import 'package:newsapp/network/http_client.dart';

class GetArticles {
  final String url = 'https://newsapi.org/v2/top-headlines?';
  final String apiKey = 'd15771f97adc457eb252b239b3473afb';
  GetArticles() {
    print('instance of get Articel crreated');
  }

  HttpClient _http = HttpClient();

  Future<List<Article>> getArticles({
    Map<String, dynamic> queryParameters,
  }) async {
    // try {
    print('fetching Data');
    final response = await _http.get(url,
        headers: {'x-api-key': apiKey}, queryParameters: queryParameters);
    final result = json.decode(response);
    print(result);
    final articles = result['articles'] as List;
    return articles.map((json) => Article.fromJson(json)).toList();
    // } on CustomException catch (err) {
    //    throw err;
    // } catch (err) {
    //   throw err;
    // }
  }
}
