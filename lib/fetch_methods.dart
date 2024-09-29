import 'dart:async';
import 'dart:convert';

import 'package:network_fetching_examples/user.dart';
import 'package:http/http.dart' as http;

class FetchMethods {
  static Future<List<User>> get(http.Client client) async {
    // Add your code here

    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
      return jsonList
          .map((json) => User.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<User> post(User user) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create user');
    }
  }

  static Future<void> put() async {
    // Add your code here
  }
  static Future<void> delete() async {
    // Add your code here
  }
}
