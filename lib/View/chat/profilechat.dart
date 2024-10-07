import 'package:flutter/material.dart';
import 'package:real__ease/core/colorpage.dart';

class PersonalChatScreen extends StatefulWidget {
  const PersonalChatScreen({super.key});

  @override
  State<PersonalChatScreen> createState() => _PersonalChatScreenState();
}

class _PersonalChatScreenState extends State<PersonalChatScreen> {
  final List<Map<String, String>> messages = [
    {"text": "Hi there!", "sender": "me"},
    {"text": "Hello! How can I help you?", "sender": "other"},
    {"text": "I have a question about the property.", "sender": "me"},
    {"text": "Sure, feel free to ask!", "sender": "other"},
  ];

  final TextEditingController _messageController = TextEditingController();
  int? _editingIndex;
  String? _editingText;

  void _deleteMessage(int index) {
    setState(() {
      messages.removeAt(index);
    });
  }

  void _clearAllChats() {
    setState(() {
      messages.clear();
    });
  }

  void _editMessage(int index, String newText) {
    setState(() {
      messages[index] = {"text": newText, "sender": messages[index]["sender"]!};
      _editingIndex = null;
      _editingText = null;
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile_picture.png'),
            ),
            const SizedBox(width: 10),
            Text("Name of Owner"),
          ],
        ),
        backgroundColor: RealColor.textcolor,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever, color: Colors.red),
            onPressed: () {
              _clearAllChats();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message["sender"] == "me";
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        setState(() {
                          _editingIndex = index;
                          _editingText = message["text"];
                          _messageController.text = _editingText!;
                        });
                      } else if (value == 'delete') {
                        _deleteMessage(index);
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem<String>(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit, color: Colors.blue),
                            const SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red),
                            const SizedBox(width: 8),
                            Text('Delete'),
                          ],
                        ),
                      ),
                    ],
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blueAccent : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Text(
                        message["text"]!,
                        style: TextStyle(
                          color: isMe ? Colors.white : Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      filled: true,
                      fillColor: RealColor.textcolor,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.mic, color: RealColor.textcolor),
                  onPressed: () {
                    // Placeholder for voice message functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.attach_file, color: RealColor.textcolor),
                  onPressed: () {
                    // Placeholder for image attachment functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.send, color: RealColor.textcolor),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        if (_editingIndex != null) {
                          _editMessage(_editingIndex!, _messageController.text);
                        } else {
                          messages.add({
                            "text": _messageController.text,
                            "sender": "me",
                          });
                        }
                        _messageController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
