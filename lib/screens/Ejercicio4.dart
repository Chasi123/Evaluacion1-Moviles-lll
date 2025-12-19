import 'package:flutter/material.dart';

class Ejercicio4 extends StatefulWidget {
  const Ejercicio4({super.key});

  @override
  State<Ejercicio4> createState() => _Ejercicio4State();
}

class _Ejercicio4State extends State<Ejercicio4> {
  final masaController = TextEditingController();
  final velocidadController = TextEditingController();

  // Función para mostrar el Alert con el resultado o errores
  void mostrarResultado(String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Resultado"),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora Energía Cinética")),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Agregamos un poco de espacio
        child: Column(
          children: [
            TextField(
              controller: masaController,
              decoration: const InputDecoration(labelText: "Masa (kg)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: velocidadController,
              decoration: const InputDecoration(labelText: "Velocidad (m/s)"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double m = double.tryParse(masaController.text) ?? 0;
                double v = double.tryParse(velocidadController.text) ?? 0;

                if (v == 0) {
                  mostrarResultado("El objeto está en reposo (Energía = 0 J).");
                } else {
                  // Aplicamos la fórmula: Ec = 1/2 * m * v²
                  double ec = 0.5 * m * (v * v);
                  mostrarResultado("La Energía Cinética es: ${ec.toStringAsFixed(2)} Joules");
                }
              },
              child: const Text("Calcular"),
            ),
          ],
        ),
      ),
    );
  }
}