import 'package:flutter/material.dart';

class TodoTitle extends StatelessWidget {
  final BuildContext context;
  const TodoTitle({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Mis tareas",
      style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary, fontSize: 30.0),
    );
  }
}
