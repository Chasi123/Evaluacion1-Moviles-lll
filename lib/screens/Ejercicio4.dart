import 'package:flutter/material.dart';

class Ejercicio4 extends StatefulWidget {
  const Ejercicio4({super.key});

  @override
  State<Ejercicio4> createState() => _Ejercicio4State();
}

class _Ejercicio4State extends State<Ejercicio4> {
  final masaController = TextEditingController();
  final velocidadController = TextEditingController();
  String resultado = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Energía Cinética")),
      body: energiaCinetica(),
    );
  }

  Widget energiaCinetica() {
    return Column(
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
        ElevatedButton(
          onPressed: () {
            double m = double.tryParse(masaController.text) ?? 0;
            double v = double.tryParse(velocidadController.text) ?? 0;

            if (v == 0) {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  content: Text("El objeto está en reposo (energía = 0)."),
                ),
              );
              setState(() {
                resultado = "0";
              });
            } else {
              setState(() {
                double ec = 0.5 * m * (v * v);
                resultado = ec.toStringAsFixed(2);
              });
            }
          },
          child: const Text("Calcular"),
        ),
        Text(
          "Energía Cinética: $resultado J",
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}