import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class PostService {
  Future<List<Post>> getPosts() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load posts");
    }
  }
}