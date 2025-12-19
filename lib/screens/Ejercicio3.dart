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
        decoration: InputDecoration(labelText: "Peso en kg"),
        keyboardType: TextInputType.number,
      ),
      Text("¿Haces ejercicio regularmente?"),
      Row(
       
        children: [
          ElevatedButton(
            onPressed: () => haceEjercicio = "Si",
            child: Text("Sí"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => haceEjercicio = "No",
            child: Text("No"),
          ),
        ],
      ),
      ElevatedButton(
        onPressed: () {
          double peso = double.parse(pesoController.text) ;
          double resultado;

          if (haceEjercicio == "Si") {
            resultado = peso * 1.6;
          } else {
            resultado = peso * 0.8;
          }

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Resultado"),
              content: Text("Debes consumir $resultado gramos de proteína al día."),
              actions: [
              BackButton(),
              ],
            ),
          );
        },
        child: Text("Ver Resultado"),
      ),
    ],
  );
} 