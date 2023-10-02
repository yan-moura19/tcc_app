import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

import 'package:tcc_app/models/parceiro.dart';



class Screen2 extends StatefulWidget {

  
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  var parceiroFiltrados = [];
  var parceiros = [];
  final List<String> categories = [
    'Roupas',
    'Eletrônicos',
    'Alimentos',
    'Livros',
    'Decoração',
    'Esportes',
    'Beleza',
    'Joias',
    'Automóveis',
    'Brinquedos',
  ];
  List<String> _preferencias = [];
  @override
  void initState(){
    super.initState();
    getUsuarios();
  }

  Future<void> getUsuarios() async {
    var url = Uri.parse('http://localhost:3000/api/usuarios');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      
          setState(() {
      final data = json.decode(response.body);
      for (var jsonData in data) {
        Parceiro parceiro = Parceiro.fromJson(jsonData);
        parceiros.add(parceiro);
        parceiroFiltrados.add(parceiro);
      }

    
      
    });
    } else {
      throw Exception('Não foi possivel pegar os produtos');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Text(
              'Escolha categorias para filtrar',
              style: GoogleFonts.rubikMonoOne(
                fontSize: 16,
                
                color: Colors.blue,
              ),
         ),

          DropDownMultiSelect(
                options: categories,
                selectedValues: _preferencias,

                onChanged: (value) {
                  setState(() {
                    parceiroFiltrados = [];
                    _preferencias = value;

                    for (var parceiro in parceiros){
                      for(var categoria in _preferencias){
                      
                        if(parceiro.categoria == categoria){
                          parceiroFiltrados.add(parceiro);
                         
                        };
                        
                      }
                    }

                  });
                  
                },
              ), 
          SizedBox(width: 30,),
          Expanded(child:  ListView.builder(
            itemCount: parceiroFiltrados.length,
           
            itemBuilder: (context, index) {
               if (parceiroFiltrados == null) {
                 
                  return Text("A lista de parceiros é nula.");
                } else {
                  var parceiro = parceiroFiltrados[index];
                  
                  return SizedBox(
                    child: Card(
                      child: ListTile(
                    title: Text("${parceiro.nome}"),
                    subtitle: Text("Subtitle"),
                    
                  ),
                    ),
                  );
                }
            },
          ),)
        ],
      ),
    );
  }
}