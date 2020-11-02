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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(message),
          ),
          ElevatedButton(
            onPressed: function,
            child: Text("Tente novamente"),
          ),
        ],
      ),
    );
  }
}
