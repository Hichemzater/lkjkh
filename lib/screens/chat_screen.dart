import 'package:chat_app_final/constant_projet.dart';
import 'package:chat_app_final/widget/mussageArea.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  static String id = 'Chat_screen';
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'Messages',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/scholar.png', width: 60),
            Text(
              ' Chat',
              style: TextStyle(color: Colors.white, fontFamily: 'pacifico'),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Messagearea(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              onSubmitted: (data) {
                messages.add({'Messages': data});
              },
              decoration: InputDecoration(
                hintText: 'Send message',
                suffixIcon: Icon(Icons.send, color: primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
