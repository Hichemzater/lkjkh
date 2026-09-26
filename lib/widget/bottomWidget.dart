import 'package:flutter/material.dart';

class Bottomwidget extends StatelessWidget {
  Bottomwidget({required this.ontap, required this.messageBotom});
  VoidCallback? ontap;
  final String messageBotom;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(messageBotom, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
