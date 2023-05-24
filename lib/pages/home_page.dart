import 'package:flutter/material.dart';
import 'package:todoapp/widgets/campo_texto.dart';
import 'package:todoapp/widgets/tarea_item.dart';

import '../models/tarea_model.dart';
import '../widgets/tarea_titulo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tarea> tareas = Tarea.tareas;
  List<Tarea> tareasFiltradas = [];

  TextEditingController addTareaController = TextEditingController();
  TextEditingController filtrarTareaController = TextEditingController();

  @override
  void initState() {
    tareasFiltradas = tareas;
    super.initState();
  }

  void addTarea(String title) {
    setState(() {
      tareas.add(Tarea(title: title));
    });
    addTareaController.clear();
  }

  void toggleCompletada(Tarea tarea) {
    setState(() {
      tarea.isDone = !tarea.isDone;
    });
  }

  void eliminarTarea(Tarea tarea) {
    setState(() {
      tareas.remove(tarea);
    });
  }

  void filtar(String value) {
    if (value.isEmpty) {
      tareasFiltradas = tareas;
    }

    tareasFiltradas = tareas
        .where(
            (tarea) => tarea.title.toLowerCase().contains(value.toLowerCase()))
        .toList();

    setState(() {
      tareasFiltradas = tareasFiltradas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: builderAppbar(context),
      body: builderBody(context),
    );
  }

  AppBar builderAppbar(context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu_rounded,
            color: Colors.white,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/62985090?v=4',
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  Widget builderBody(context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: Column(
            children: [
              // cuadro busqueda
              CampoTexto(
                controller: filtrarTareaController,
                onChange: filtar,
                hint: "Filtrar tareas",
                icono: const Icon(
                  Icons.search_rounded,
                ),
              ),
              // titulo
              const SizedBox(
                height: 50.0,
              ),
              Expanded(
                child: ListView(
                  children: [
                    TodoTitle(context: context),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: [
                        for (Tarea tarea in tareasFiltradas.reversed)
                          TareaItem(
                            tarea: tarea,
                            eliminarTarea: eliminarTarea,
                            toggleTarea: toggleCompletada,
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 70.0,
                    )
                  ],
                ),
              ),
              //
            ],
          ),
        ),
        // text field y botton
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CampoTexto(
                    controller: addTareaController,
                    hint: "Añadir tarea",
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                FloatingActionButton(
                  onPressed: () {
                    addTarea(addTareaController.text);
                  },
                  child: const Icon(Icons.add_rounded),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
