import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  String buttonLabel;

  Answer(this.buttonLabel, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          child: Text(buttonLabel),
          onPressed: () => selectHandler(buttonLabel)),
    );
  }
}
