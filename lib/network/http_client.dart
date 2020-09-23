import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:newsapp/network/custom_exception.dart';

class HttpClient<T> {
  Future get(
    String url, {
    Map<String, String> headers,
    Map<String, dynamic> queryParameters,
  }) async {
    final uri = Uri.parse(url);
    final finalUrl = uri.replace(queryParameters: queryParameters);
    print(finalUrl);

    try {
      final response = await http.get(finalUrl, headers: headers);

      return response.body;
    } on SocketException {
      print('error 1');
      throw CustomException('No Internet Connection');
    } on HttpException {
      print('error 2');

      throw CustomException('Couldn\'t able to reach url');
    } on FormatException {
      print('error 3');

      throw CustomException('Bad Response');
    }
  }
}
