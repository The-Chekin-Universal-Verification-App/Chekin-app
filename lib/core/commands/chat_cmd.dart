import 'package:lookapp/export.dart';
import 'package:flutter/material.dart';

class ChatCmd extends BaseCommand {
  ChatCmd(super.c);
  ChatProvider get chat => getProvider();

  void sendMessage() async {
    BuildContext context = rootNav!.context;

    ChatService chat = ChatService();

    String prompt = "Hello, what's your name?";
    var response = await chat.sendRequest(prompt);
    print(response);
  }
}
