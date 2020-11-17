import 'package:flutter/material.dart';

class ErrorChild extends StatelessWidget {
  final String error;
  const ErrorChild({@required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
