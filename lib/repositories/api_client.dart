import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class ApiClient {
  final http.Client httpClient;

  ApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<dynamic>> getJson(url) async {
    final response = await this.httpClient.get(url);
    print("Response Status code is: ${response.statusCode}");
    if (response.statusCode != 200) {
      print("Error body = ${response.body}");
      throw Exception('Failed to load JSON');
    } else {
      return jsonDecode(response.body);
    }
  }
}
