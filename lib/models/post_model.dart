// 📁 lib/models/post_model.dart

class Post {
  final int id;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  // 🔥 تحويل JSON إلى Object
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

  // 🔥 (اختياري) تحويل Object إلى JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
    };
  }
}