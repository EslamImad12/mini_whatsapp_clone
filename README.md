📱 Mini WhatsApp Clone (Flutter)

A simple Flutter chat application that simulates a WhatsApp-like experience. The project demonstrates core Flutter concepts including API integration, state management, reusable widgets, navigation, and local data persistence.

🚀 Features
💬 Chat list screen (contacts list)
📩 Chat details screen with messaging UI
📡 Fetching users data from a REST API
🧠 Local message persistence using SharedPreferences
✍️ Send and display messages in real-time UI
🔁 Scroll-to-latest message automatically
🎨 Clean WhatsApp-inspired UI design
♻️ Reusable widgets (message bubbles)
🧱 Tech Stack
Flutter
Dart
HTTP package (http)
Local Storage (shared_preferences)
📂 Project Structure
lib/
 ├── models/
 │     ├── chat_model.dart
 │     └── message_model.dart
 │
 ├── screens/
 │     ├── chats_screen.dart
 │     └── chat_details.dart
 │
 ├── services/
 │     └── chat_service.dart
 │
 └── widgets/
       └── message_bubble.dart
🧠 Key Concepts Used
Stateful & Stateless Widgets
Navigation (Navigator.push / pop)
JSON Parsing (fromJson)
REST API consumption
Local storage persistence
UI state updates using setState
Widget reuse and separation of concerns
🔌 API Used

This project uses a mock REST API:

https://jsonplaceholder.typicode.com/users

It provides sample user data used to populate the chat list.

💾 Local Storage

Messages are stored locally using SharedPreferences so that:

Messages persist after closing the app
Each chat has its own saved history
📸 App Flow
Load chat list from API
Tap on a chat
Open chat details screen
Send messages
Messages are saved locally and restored on reopen
🎯 Purpose of the Project

This project was built for learning purposes to practice:

Flutter UI building
State management basics
API integration
Clean code structure
Real-world app architecture fundamentals
🔥 Future Improvements
Firebase real-time chat integration
User authentication system
Online/offline status
Message timestamps formatting
Dark mode support
Search chats functionality

⭐ If you like this project

You can star the repository and use it as a base for building more advanced chat applications.