import 'package:chat_app_final/constant_projet.dart';
import 'package:flutter/material.dart';

class Messagearea extends StatelessWidget {
  const Messagearea({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 18, top: 28, bottom: 28, right: 18),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),

        child: Text(
          'hello bro , how are you ',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
