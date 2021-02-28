import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox({
    Key key,
    @required this.message,
    this.function,
  })  : assert(message != null, 'Uma string não nula deve ser fornecida'),
        super(key: key);

  final String message;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 250,
            child: Center(
              child: Text(
                message,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(height: 10),
          ElevatedButton(
            onPressed: function,
            child: Text(
              "Tente novamente",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
