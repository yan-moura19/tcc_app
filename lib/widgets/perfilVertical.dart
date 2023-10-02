import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class ListPerfilVertical extends StatefulWidget {
  const ListPerfilVertical({super.key ,required this.onSubmit});
  final Function(Map<String, dynamic>) onSubmit;

  @override
  State<ListPerfilVertical> createState() => _ListPerfilVerticalState();
}

class _ListPerfilVerticalState extends State<ListPerfilVertical> {
  var usuarios = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getUsuarios(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                usuarios = snapshot.data!;
                var usuario = snapshot.data![index];
                return Card(shadowColor: Colors.black12,
                    child: ListTile(
                  onTap: (() {
                    widget.onSubmit(usuario);
                  }),
                  
                  title: Text(usuario['nome'],style: GoogleFonts.montserrat(
                fontSize: 16,
                
                color: Color.fromARGB(255, 0, 0, 0),
              ),),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('Categoria: ${usuario['nome']}',style: GoogleFonts.montserrat(
                fontSize: 16,
                
                color: Color.fromARGB(255, 0, 0, 0),
              ),),
                             
                            ],
                          ),
                          Row(
                            children: [
                              Text('Preco: ${usuario['imagem']}',style: GoogleFonts.montserrat(
                fontSize: 16,
                
                color: Color.fromARGB(255, 0, 0, 0),
              ),),
                              
                            ],
                            mainAxisAlignment: MainAxisAlignment.end,
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ));
              });
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
