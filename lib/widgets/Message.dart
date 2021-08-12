import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;

  Message({required this.message});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(message, style: TextStyle(fontSize: 22.0,color: Colors.black), textAlign: TextAlign.center,),
    );
  }
}