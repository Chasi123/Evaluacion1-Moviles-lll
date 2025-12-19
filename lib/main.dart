import 'package:app_evaluacion/screens/Ejercicio5.dart';
import 'package:flutter/material.dart';
import 'package:app_evaluacion/screens/ejercicio2.dart'; 
import 'package:app_evaluacion/screens/Ejercicio3.dart';
import 'package:app_evaluacion/screens/Ejercicio4.dart';

void main() {
  runApp(const Evaluacion());
}

class Evaluacion extends StatelessWidget {
  const Evaluacion({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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

  void _mostrarInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Ejercicios de Programación"),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Programador: Juan Paz"),
            Text("Carrera: Desarrollo de Software"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cerrar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> paginas = [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            "Home",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
      const Ejercicio2(),
      const Ejercicio3(),
      const Ejercicio4(),
      const Ejercicio5(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'Ej 2'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'Ej 3'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'Ej 4'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'Ej 5'),
        ],
      ),
    );
  }
}