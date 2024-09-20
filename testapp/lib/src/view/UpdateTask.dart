import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateTask extends StatelessWidget{
  const UpdateTask({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Actualizar Tareas"),
      ),
    );
  }
}