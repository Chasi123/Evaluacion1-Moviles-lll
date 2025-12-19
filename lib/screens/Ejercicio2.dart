import 'package:flutter/material.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    final h = TextEditingController();
    final d = TextEditingController();
    final g = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Ejercicio 2")),
      body: Column(
        children: [
          TextField(controller: h, decoration: const InputDecoration(labelText: "Profundidad")),
          TextField(controller: d, decoration: const InputDecoration(labelText: "Densidad (Opcional)")),
          TextField(controller: g, decoration: const InputDecoration(labelText: "Gravedad (Opcional)")),
          
          ElevatedButton(
            onPressed: () {
              double profundidad = double.parse(h.text);
              double densidad = d.text.isEmpty ? 1000 : double.parse(d.text);
              double gravedad = g.text.isEmpty ? 9.8 : double.parse(g.text);

              if (profundidad < 0) {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    content: Text("La profundidad no puede ser negativa"),
                  ),
                );
              } else {
                // Alerta con el resultado
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
        ],
      ),
    );
  }
}