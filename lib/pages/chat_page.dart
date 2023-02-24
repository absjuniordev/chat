import 'dart:math';
import 'package:chat/coponents/messages.dart';
import 'package:chat/coponents/new_messages.dart';
import 'package:chat/core/models/chat_notification.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/services/notification/chat_notification_service.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chat'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: const [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text('Sair'),
                      ],
                    ),
                  ),
                )
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return const NotificationPage();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.notifications),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  maxRadius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    '${Provider.of<ChatNotificationService>(context).itemsCount}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<ChatNotificationService>(
      //       context,
      //       listen: false,
      //     ).add(ChatNotification(
      //       title: 'Mais uma Notificação!',
      //       body: Random().nextDouble().toString(),
      //     ));
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
