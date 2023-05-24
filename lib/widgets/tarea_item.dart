import 'package:flutter/material.dart';
import 'package:todoapp/models/tarea_model.dart';

class TareaItem extends StatelessWidget {
  final Tarea tarea;
  final Function(Tarea tarea) eliminarTarea;
  final Function(Tarea tarea) toggleTarea;

  const TareaItem({
    super.key,
    required this.tarea,
    required this.eliminarTarea,
    required this.toggleTarea,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Card(
        child: ListTile(
          onTap: () {
            toggleTarea(tarea);
          },
          tileColor: Theme.of(context).colorScheme.background,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Icon(
            tarea.isDone
                ? Icons.check_box_rounded
                : Icons.check_box_outline_blank_rounded,
          ),
          iconColor: Theme.of(context).colorScheme.primary,
          trailing: IconButton(
            onPressed: () {
              eliminarTarea(tarea);
            },
            icon: Icon(
              Icons.delete_rounded,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          minVerticalPadding: 20.0,
          title: Text(
            tarea.title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              decoration: tarea.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
      ),
    );
  }
}
