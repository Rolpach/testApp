import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteTask extends StatelessWidget{
  const DeleteTask({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Actualizar Tareas"),
      ),
    );
  }
}