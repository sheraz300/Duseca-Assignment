import 'package:duseca_assignment/src/core/config/app_routes.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatListPage extends StatelessWidget {
  ChatListPage({super.key});

  final List<Map<String, dynamic>> pinnedChats = [
    {
      "name": "Alphaboard",
      "lastMessage": "Jane: Hello, Mark! I am wr...",
      "unreadCount": 3,
      "avatar": Colors.purple,
    },
    {
      "name": "Design Team",
      "lastMessage": "You: Hello. Can you drop t...",
      "unreadCount": 2,
      "avatar": Colors.orange,
    },
    {
      "name": "Dustin Williamson",
      "lastMessage": "✏️ Dustin is typing...",
      "unreadCount": 5,
      "avatar": Colors.blue,
    },
  ];

  final List<Map<String, dynamic>> allChats = [
    {
      "name": "Jane Wilson",
      "lastMessage": "Hi! How are you, Steve? 😃",
      "unreadCount": 0,
      "avatar": Colors.orange,
    },
    {
      "name": "Brandon Pena",
      "lastMessage": "How about going somew...",
      "unreadCount": 0,
      "avatar": Colors.green,
    },
    {
      "name": "Nathan Fox",
      "lastMessage": "Hello. We have a meeting...",
      "unreadCount": 0,
      "avatar": Colors.grey,
    },
    {
      "name": "Jacob Hawkins",
      "lastMessage": "Well done! 👍",
      "unreadCount": 1,
      "avatar": Colors.purple,
    },
    {
      "name": "Shane Black",
      "lastMessage": "Paul's having a party tom...",
      "unreadCount": 0,
      "avatar": Colors.blue,
    },
    {
      "name": "Priscilla Edwards",
      "lastMessage": "It's up to you.",
      "unreadCount": 0,
      "avatar": Colors.red,
    },
    {
      "name": "Kristin Mccoy",
      "lastMessage": "It looks amazing!",
      "unreadCount": 0,
      "avatar": Colors.yellow,
    },
    {
      "name": "Bruce Russell",
      "lastMessage": "Hi, any progress on the p...",
      "unreadCount": 3,
      "avatar": Colors.teal,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("PINNED"),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pinnedChats.length,
              itemBuilder: (context, index) {
                return _buildChatTile(
                  context,
                  name: pinnedChats[index]["name"],
                  lastMessage: pinnedChats[index]["lastMessage"],
                  unreadCount: pinnedChats[index]["unreadCount"],
                  avatarColor: pinnedChats[index]["avatar"],
                );
              },
            ),
            _buildSectionTitle("ALL MESSAGES"),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: allChats.length,
              itemBuilder: (context, index) {
                return _buildChatTile(
                  context,
                  name: allChats[index]["name"],
                  lastMessage: allChats[index]["lastMessage"],
                  unreadCount: allChats[index]["unreadCount"],
                  avatarColor: allChats[index]["avatar"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget _buildChatTile(
    BuildContext context, {
    required String name,
    required String lastMessage,
    required int unreadCount,
    required Color avatarColor,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: avatarColor,
        child: Text(name[0], style: TextStyle(color: Colors.white)),
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        lastMessage,
        style: TextStyle(color: Colors.grey),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: unreadCount > 0
          ? CircleAvatar(
              backgroundColor: Colors.red,
              radius: 10,
              child: Text(
                "$unreadCount",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          : SizedBox.shrink(),
      onTap: () {
        context.pushNamed(AppRoutes.chat);
      },
    );
  }
}
