import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../service/chat_service.dart';
import 'chat_details.dart';

class ChatsScreen extends StatefulWidget {
  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final ChatService service = ChatService();

  List<Chat> chats = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadChats();
  }

  void loadChats() async {
  try {
    final data = await service.getChats();
    print("DATA: $data");

    setState(() {
      chats = data;
      isLoading = false;
    });
  } catch (e) {
    print("ERROR: $e");

    setState(() {
      isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats API"),
        backgroundColor: Colors.green,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
            return ListTile(
  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),

  leading: CircleAvatar(
    radius: 25,
    backgroundColor: Colors.green,
    child: Text(
      chat.name[0].toUpperCase(),
      style: TextStyle(color: Colors.white),
    ),
  ),

  title: Text(
    chat.name,
    style: TextStyle(fontWeight: FontWeight.bold),
  ),

  subtitle: Text(
    chat.message,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  ),

  trailing: Text(
    chat.time,
    style: TextStyle(fontSize: 12, color: Colors.grey),
  ),

  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChatDetails(chat: chat),
      ),
    );
  },
);
              },
            ),
    );
  }
}