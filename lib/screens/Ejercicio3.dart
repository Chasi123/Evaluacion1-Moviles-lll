import 'package:flutter/material.dart';

class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora de Proteína")),
      body: proteina(context),
    );
  }
}

Widget proteina(BuildContext context) {
  TextEditingController pesoController = TextEditingController();
  String haceEjercicio = "No";

  return Column(
    children: [
      TextField(
        controller: pesoController,
        decoration: const InputDecoration(labelText: "Peso en kg"),
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 10),
      const Text("¿Haces ejercicio regularmente?"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => haceEjercicio = "Si",
            child: const Text("Sí"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => haceEjercicio = "No",
            child: const Text("No"),
          ),
        ],
      ),
      ElevatedButton(
        onPressed: () {
          double peso = double.tryParse(pesoController.text) ?? 0;
          double resultado;

          if (haceEjercicio == "Si") {
            resultado = peso * 1.6;
          } else {
            resultado = peso * 0.8;
          }

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Resultado"),
              content: Text("Debes consumir $resultado gramos de proteína al día."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cerrar"),
                )
              ],
            ),
          );
        },
        child: const Text("Ver Resultado"),
      ),
    ],
  );
}