import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<http.Response> login(
      String loginUrl, String userName, String password) async {
    try {
      final url = Uri.parse(loginUrl);
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': userName,
          'password': password,
        }),
      );
      return response;
    } on Exception catch (e) {
      debugPrint('Login Exception ${e.toString()}');
      rethrow;
    }
    /*if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create post');
    }*/
  }

  Future<http.Response> signup(
      String signupUrl, String userName, String email, String password) async {
    final url = Uri.parse(signupUrl);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'name': userName,
        'email': email,
        'password': password,
      }),
    );
    return response;
  }
}

/*Future<dynamic> get(String url) async {
  print('Api Get, url $url');
  var responseJson;
  try {
    final response = await http.get(_baseURL + url);
    responseJson = _returnResponse(response);
  } on SocketException {
    debugPrint('No Internet connection');
    throw BaseException(message: 'No Internet connection');
  }
  print('api get recieved!');
  return responseJson;
}

Future<dynamic> post(String url, dynamic body) async {
  print('Api Post, url $url');
  var responseJson;
  try {
    final response = await http.post(_baseURL + url, body: body);
    responseJson = _returnResponse(response);
  } on SocketException {
    print('No net');
    throw FetchDataException('No Internet connection');
  }
  print('api post.');
  return responseJson;
}

Future<dynamic> put(String url, dynamic body) async {
  print('Api Put, url $url');
  var responseJson;
  try {
    final response = await http.put(_baseURL + url, body: body);
    responseJson = _returnResponse(response);
  } on SocketException {
    print('No net');
    throw FetchDataException('No Internet connection');
  }
  print('api put.');
  print(responseJson.toString());
  return responseJson;
}

Future<dynamic> delete(String url) async {
  print('Api delete, url $url');
  var apiResponse;
  try {
    final response = await http.delete(_baseURL + url);
    apiResponse = _returnResponse(response);
  } on SocketException {
    print('No net');
    throw FetchDataException('No Internet connection');
  }
  print('api delete.');
  return apiResponse;
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}*/

/*  Future<Post> fetchPost(int postId) async {
    final url = Uri.parse("$postsEndpoint/$postId");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post: $postId');
    }
  }

  Future<Post> createPost(String title, String body) async {
    final url = Uri.parse(postsEndpoint);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'title': title,
        'body': body,
      }),
    );
    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future<Post> updatePost(int postId, String title, String body) async {
    final url = Uri.parse(postsEndpoint + "/$postId");
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'title': title,
        'body': body,
      }),
    );
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update post');
    }
  }

  Future<Post> deletePost(int postId) async {
    final url = Uri.parse(postsEndpoint + "/$postId");
    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete post: $postId');
    }
  }*/

/*class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  // Common method to handle GET requests
  Future<Map<String, dynamic>> get(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(url, headers: headers);

    return _processResponse(response);
  }

  // Common method to handle POST requests
  Future<Map<String, dynamic>> post(String endpoint, {Map<String, String>? headers, Object? body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(
      url,
      headers: headers ?? {'Content-Type': 'application/json'},
      body: body != null ? jsonEncode(body) : null,
    );

    return _processResponse(response);
  }

  // Common method to handle PUT requests
  Future<Map<String, dynamic>> put(String endpoint, {Map<String, String>? headers, Object? body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.put(
      url,
      headers: headers ?? {'Content-Type': 'application/json'},
      body: body != null ? jsonEncode(body) : null,
    );

    return _processResponse(response);
  }

  // Common method to handle DELETE requests
  Future<Map<String, dynamic>> delete(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.delete(url, headers: headers);

    return _processResponse(response);
  }

  // Process the HTTP response and return a Map
  Map<String, dynamic> _processResponse(http.Response response) {
    final int statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
      // Assuming the response body is JSON
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      // Handle errors or unsuccessful responses
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }
}*/
