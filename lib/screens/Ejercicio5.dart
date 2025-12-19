import 'dart:convert';

import 'package:flutter/material.dart';

class Ejercicio5 extends StatelessWidget {
  const Ejercicio5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("musica 2"),
      ),
      body: Listar(context),
    );
  }
}

Future<List> leerLista(context) async {
  final jsonString = await DefaultAssetBundle.of(context).loadString("assets/data/musica2.json");
  return json.decode(jsonString)['musica'];
}

Widget Listar(context){
  return FutureBuilder(future: leerLista(context), builder: (context, snapshot) {
    if(snapshot.hasData){
      List data = snapshot.data!;

      return ListView.builder( itemCount: data.length, itemBuilder:(context, index) {
        final item = data[index];

        return ListTile(
          title: Text(item['title']),
          subtitle: Column(
            children: [
              Text("Album: ${item['album'] ['title']}"),
              Image.network(item['media']['cover_image']),
              Text("Año: ${item['year']}"),
              Container( 
                child: Text("Url de la canción: ${item['media']['url']}"))
            ],
          ),);
      }, );

    }else{
      return CircularProgressIndicator();
    }
  }, );
}