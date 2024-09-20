import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/src/viewmodel/Tareas_ViewModel.dart';

class TaskList extends StatelessWidget{
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    //Acceso al ViewModel usando provider
    final tareasViewModel = Provider.of<Tareas_ViewModel>(context);

    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de Tareas / API'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ListView.builder(
              itemCount: tareasViewModel.tasks.length, // Número de items
              shrinkWrap: true,
              itemBuilder: (BuildContext context, i) {
                final task = tareasViewModel.tasks[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    elevation: 5, // Sombra alrededor de la tarjeta
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient( // Efecto de gradiente
                          colors: [Colors.blue.shade200, Colors.blue.shade400],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16.0), // Más espacio dentro del ListTile
                        title: Text(
                          task.title, // Título de la tarea
                          style: TextStyle(
                            color: Colors.white, // Color del texto
                            fontSize: 20, // Tamaño de letra
                            fontWeight: FontWeight.bold, // Negritas
                          ),
                        ),
                        subtitle: Text(
                          task.description,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8), // Color sutil para el subtítulo
                            fontSize: 16,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.white),
                              onPressed: () {
                                print('Editar presionado');
                              },
                              splashColor: Colors.white24, // Efecto de toque
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.white),
                              onPressed: () {
                                print('Eliminar presionado');
                              },
                              splashColor: Colors.white24, // Efecto de toque
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: (){_showCustomModal(context);},
                  child: Icon(Icons.add), foregroundColor: Colors.white,)
            )
          ],
        )
      )
    );
  }
}

//Modal Crear Tarea
void _showCustomModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          child: Form(
            child:Padding(padding: const EdgeInsets.all(20.0) ,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 400,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black)

                      ),
                      child: TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Required Field';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ingresa nombre de la tarea',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      width: 400,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black)
                      ),
                      child: TextFormField(
                        maxLines: 5,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Required Field';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ingresa la descripcion de la tarea',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child:   Container(
                              color: Colors.red,
                              width:100,
                              height: 35,
                              child: Center(
                                child: StreamBuilder<Object>(
                                    stream: null,
                                    builder: (context, snapshot) {
                                      return Text('Cerrar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),);
                                    }
                                ),
                              )
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                            color: Colors.black,
                            width:100,
                            height: 35,
                            child: Center(
                              child: StreamBuilder<Object>(
                                  stream: null,
                                  builder: (context, snapshot) {
                                    return Text('Guardar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),);
                                  }
                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
      );
    },
  );
}