import 'dart:html';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ModalWidget extends StatefulWidget {
  
  ModalWidget({super.key , required this.objeto});

  final dynamic? objeto;

  @override
  State<ModalWidget> createState() => _ModalWidgetState();
  
}

class _ModalWidgetState extends State<ModalWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        height: double.infinity,
                  child: Card(
                        child: ListTile(
                        title: Text('${widget.objeto['nome']}'),
                        leading: Text("IMG"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Text("Alguns dados da loja"),
                          Text("Alguns dados da loja"),
                          Text("Alguns dados da loja")
                        ]),
                        trailing: TextButton.icon(onPressed: (){print("link/${widget.objeto['parceria']['usuario']}");}, icon:Icon(
                      FontAwesomeIcons.instagram,
                      size: 40,
                    ), label: Text("Visitar Perfil"),)
                      )),
                ),
    );
  }
}