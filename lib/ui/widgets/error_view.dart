import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  String message;
  ErrorView(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message
      ),
    );
  }
}
