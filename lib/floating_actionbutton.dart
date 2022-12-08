import 'package:flutter/material.dart';
import 'input_form.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({Key? key}) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      padding: const EdgeInsets.all(5),
      child: FittedBox(
        child: FloatingActionButton(
          elevation: 5,
          child: const Text("+", style:
          TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.normal
          ),
          ),
          onPressed: ()
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InputForm())
            );
          }
        ),
      )
    );
  }
}
