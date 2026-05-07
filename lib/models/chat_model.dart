class Chat {
  final int id;
  final String name;
  final String message;
  final String time;

  Chat({
    required this.id,
    required this.name,
    required this.message,
    required this.time,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json["id"] ?? 0,
      name: json["firstName"] ?? "No Name",
      message: "Hi I am ${json["firstName"] ?? "User"}",
      time: "Now",
    );
  }
}