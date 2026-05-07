import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/chat_model.dart';

class ChatService {
  Future<List<Chat>> getChats() async {
    final url = Uri.parse("https://dummyjson.com/users");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List users = data["users"];

      return users.map((json) => Chat.fromJson(json)).toList();
    }

    throw Exception("Failed to load chats");
  }
}