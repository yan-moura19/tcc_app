import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class ListPerfilHorizontal extends StatefulWidget {
  const ListPerfilHorizontal({super.key, required this.onSubmit});
 final Function(Map<String, dynamic>) onSubmit;
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
              itemCount: 3,
              itemBuilder: (context, index) {
                usuarios = snapshot.data!;
                var usuario = snapshot.data![index];
                return Container(
                  padding: EdgeInsetsDirectional.all(2),
                  width: 165,
                  height: 150,
                  child:  Card(
                    child: ListTile(
                  onTap: (() {
                      widget.onSubmit(usuario);
                  }),
                  
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
