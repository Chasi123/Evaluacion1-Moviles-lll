import 'package:flutter/material.dart';
import 'package:app_evaluacion/screens/Ejercicio4.dart';
import 'package:app_evaluacion/screens/Ejercicio5.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Presion de un liquido")),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/fondo.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          presionLiquido(context),
        ],
      ),
    );
  }
}

Widget presionLiquido(BuildContext context) {
  TextEditingController h = TextEditingController();
  TextEditingController d = TextEditingController();
  TextEditingController g = TextEditingController();

  return Column(
    children: [
      TextField(controller: h, decoration: const InputDecoration(labelText: "Profundidad")),
      TextField(controller: d, decoration: const InputDecoration(labelText: "Densidad")),
      TextField(controller: g, decoration: const InputDecoration(labelText: "Gravedad")),
      
      ElevatedButton(
        onPressed: () {
          double profundidad = double.parse(h.text);
          double densidad = double.parse(d.text);
          double gravedad = double.parse(g.text);

          if (profundidad < 0) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                content: Text("La profundidad no puede ser negativa"),
              ),
            );
          } else {
            double presion = densidad * gravedad * profundidad;
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text("La presión es: $presion"),
              ),
            );
          }
        },
        child: const Text("Calcular"),
      ),

      ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Ejercicio4()));
        },
        child: const Text("Ir al Ejercicio 3"),
      ),
      
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Ejercicio5()));
        },
        child: const Text("Ir al Ejercicio 4"),
      ),
    ],
  );
}