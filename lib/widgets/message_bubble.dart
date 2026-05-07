import 'package:flutter/material.dart';
import '../models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.green : Colors.grey.shade300,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft:
                Radius.circular(message.isMe ? 12 : 0),
            bottomRight:
                Radius.circular(message.isMe ? 0 : 12),
          ),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}