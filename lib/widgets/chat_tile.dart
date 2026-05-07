import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatTile extends StatelessWidget {
  final Chat chat;

  const ChatTile({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(chat.name[0]),
        ),
        title: Text(chat.name),
        subtitle: Text(chat.message),
        trailing: Text(chat.time),
      ),
    );
  }
}