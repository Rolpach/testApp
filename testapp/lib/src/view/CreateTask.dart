import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget{
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Crear Tarea"),
      ),
      body: Form(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height:30,
              ),
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
              const SizedBox(
                width: double.infinity,
                height: 25,
              ),
              Container(
                width: 400,
                padding: EdgeInsets.all(8.0),
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
              const SizedBox(
                width: double.infinity,
                height: 25,
              ),
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
        ),
      ),
    );
  }




}