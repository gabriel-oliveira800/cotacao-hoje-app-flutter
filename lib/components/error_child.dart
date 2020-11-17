import 'package:flutter/material.dart';

class ErrorChild extends StatelessWidget {
  final String error;
  final Function callback;
  const ErrorChild({@required this.error, this.callback});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            error,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:18.0),
          child: SizedBox(
            height: 48,
            width: size.width * 0.70,
            child: RaisedButton.icon(
              onPressed: callback,
              icon: Icon(Icons.refresh),
              label: Text('Tentar novamente'),
            ),
          ),
        )
      ],
    );
  }
}
