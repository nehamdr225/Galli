import 'package:flutter/material.dart';

class ErrorDialogWidget extends StatelessWidget {
  ErrorDialogWidget(this.title, this.m1);
  final String title;
  final String m1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(m1),
    );
  }
}

class TurnOnLocation extends StatelessWidget {
  TurnOnLocation(this.title, this.m1);
  final String title;
  final String m1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(m1),
    );
  }
}