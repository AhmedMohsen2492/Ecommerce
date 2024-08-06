import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  String message;

  ErrorView(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
