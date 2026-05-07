import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/chat_model.dart';
import '../models/message_model.dart';

class ChatDetails extends StatefulWidget {
  final Chat chat;

  const ChatDetails({super.key, required this.chat});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List<Message> messages = [];

  String get storageKey => "chat_${widget.chat.id}";

  @override
  void initState() {
    super.initState();
    loadMessages();
  }

  Future<void> loadMessages() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(storageKey);

    if (data != null) {
      final List decoded = jsonDecode(data);

      messages = decoded
          .map((e) => Message(
                text: e["text"],
                isMe: e["isMe"],
              ))
          .toList();
    } else {
      messages = [
        Message(
          text: widget.chat.message,
          isMe: false,
        ),
      ];
    }

    setState(() {});

    Future.delayed(Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.jumpTo(
          scrollController.position.maxScrollExtent,
        );
      }
    });
  }

  Future<void> saveMessages() async {
    final prefs = await SharedPreferences.getInstance();

    final data = messages
        .map((e) => {
              "text": e.text,
              "isMe": e.isMe,
            })
        .toList();

    prefs.setString(storageKey, jsonEncode(data));
  }

void sendMessage() {
  if (controller.text.trim().isEmpty) return;

  setState(() {
    messages.add(
      Message(
        text: controller.text,
        isMe: true,
      ),
    );
  });

  controller.clear();
  saveMessages();

  Future.delayed(Duration(milliseconds: 100), () {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  });
}

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chat.name),
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [

          // Messages
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];

                return Align(
  alignment:
      message.isMe ? Alignment.centerRight : Alignment.centerLeft,
  child: Container(
    margin: EdgeInsets.symmetric(vertical: 4),
    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    decoration: BoxDecoration(
      color: message.isMe ? Colors.green : Colors.grey.shade300,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomLeft:
            Radius.circular(message.isMe ? 16 : 0),
        bottomRight:
            Radius.circular(message.isMe ? 0 : 16),
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
              },
            ),
          ),

          // Input
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.grey.shade200,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Type message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: sendMessage,
                  icon: Icon(Icons.send, color: Colors.green),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}