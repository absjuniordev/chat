import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/chat_message.dart';
import '../../models/chat_user.dart';
import 'chat_service.dart';

class ChatFireBaseService implements ChatService {
  static MultiStreamController<List<ChatMessage>>? _controller;

  @override
  Stream<List<ChatMessage>> messagesStrem() {
    return Stream<List<ChatMessage>>.empty();
  }

  @override
  Future<ChatMessage?> save(String text, ChatUser user) async {
    final store = FirebaseFirestore.instance;

    //ChatMessage => Map
    store.collection('chat').add({
      'text': text,
      'createdAt': DateTime.now().toIso8601String(),
      'userId': user.id,
      'userName': user.name,
      'userImageURL': user.imageURL,
    });

    return null;
  }
}
