import 'package:flutter/material.dart';
import 'package:app_evaluacion/screens/ejercicio2.dart'; 
import 'package:app_evaluacion/screens/Ejercicio3.dart';

void main() {
  runApp(const Evaluacion());
}

class Evaluacion extends StatelessWidget {
  const Evaluacion({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatefulWidget {
  const Cuerpo({super.key});

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
  int indice = 0;


  @override
  Widget build(BuildContext context) {
    final List<Widget> paginas = [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/fondo.jpg"),
            fit: BoxFit.cover

          ),
        ),
    ),
      const Ejercicio2(),
      const Ejercicio3(),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicios"),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => _mostrarInfo(context),
          ),
        ],
        
      ),
      body: paginas[indice],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indice,
        onTap: (value) {
          setState(() {
            indice = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'Ej 1'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'Ej 2'),

        ],
      ),
    );
  }
}
  void _mostrarInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Titulo :Ejercicios de Programación "),
        
        content: Column(
          children: [
            Text("Programador: Christopher  Chasiloa"),
            Text("Carrera: Desarrollo de Software"),
            
          ],
        ),
        actions: [
          BackButton(),
        ],
      ),
    );
  }