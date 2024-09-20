import 'package:flutter/cupertino.dart';
import 'package:testapp/flutter/material.dart';
import 'package:testapp/src/model/TaskModel.dart';

class Tareas_ViewModel extends ChangeNotifier{


  //Lista de tareas
  List<Tarea> tasks = [
    Tarea(title: "Tarea 1", description: "Es una tarea de prueba numerada con el 1"),
    Tarea(title: "Tarea 2", description: "Es una tarea de prueba numerada con el 2"),
    Tarea(title: "Tarea 3", description: "Es una tarea de prueba numerada con el 3"),
  ];

  //Metodo para agregar una nueva tarea
  void addTarea(Tarea _tarea){
    tasks.add(_tarea);
    notifyListeners();
  }

  //Metodo para eliminar una tarea
  void deleteTarea(int _index){
    tasks.removeAt(_index);
    notifyListeners();
  }
}