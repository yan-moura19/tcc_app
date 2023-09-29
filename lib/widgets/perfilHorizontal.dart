import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class ListPerfilHorizontal extends StatefulWidget {
  const ListPerfilHorizontal({super.key});

  @override
  State<ListPerfilHorizontal> createState() => _ListPerfilHorizontalState();
}

class _ListPerfilHorizontalState extends State<ListPerfilHorizontal> {
  var usuarios = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getUsuarios(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
                  height: 150,
                  child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                usuarios = snapshot.data!;
                var usuario = snapshot.data![index];
                return Container(
                  width: 250,
                  height: 250,
                  child:  Card(
                    child: ListTile(
                  onTap: (() {
                  }),
                  leading: Text(usuario['nome']),
                  title: Text('Categoria: ${usuario['nome']} '),
                  subtitle:
                     Text('Preco: ${usuario['imagem']}'), 
                )));
              }));
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  getUsuarios() async {
    var url = Uri.parse('http://localhost:3000/api/usuarios');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Não foi possivel pegar os produtos');
    }
  }
}
