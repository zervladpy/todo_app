class Tarea {
  final String title;
  bool isDone;

  Tarea({
    required this.title,
    this.isDone = false,
  });

  static List<Tarea> tareas = [];
}
