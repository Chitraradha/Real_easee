import 'package:flutter/material.dart';
import 'package:real__ease/View/chat/profilechat.dart';

class ChathomeScreen extends StatefulWidget {
  const ChathomeScreen({super.key});

  @override
  State<ChathomeScreen> createState() => _ChathomeScreenState();
}

class _ChathomeScreenState extends State<ChathomeScreen> {
  final List<Map<String, String>> chats = [
    {"name": "John Doe", "lastMessage": "Hey, how are you?", "time": "2:30 PM"},
    {"name": "Jane Smith", "lastMessage": "Let's meet tomorrow.", "time": "1:45 PM"},
    {"name": "Emily Johnson", "lastMessage": "Got it, thanks!", "time": "12:00 PM"},
    // Add more chat entries here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        backgroundColor: Color.fromARGB(255, 255, 255, 255), // Attractive color for the app bar
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple.shade100,
                child: Text(
                  chat["name"]![0],
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                chat["name"]!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              subtitle: Text(
                chat["lastMessage"]!,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              trailing: Text(
                chat["time"]!,
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
              onTap: () {
                // Navigate to the chat screen or perform any action
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalChatScreen(), // Replace with your chat screen
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
