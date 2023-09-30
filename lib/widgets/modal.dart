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

      body: Container(
        height: 200,
        
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Card(
                        
                        child: ListTile(
                        title: Text('${widget.objeto['nome']}'),
                        leading: Text("IMG"),
                        subtitle: Text("Alguns dados da loja"),
                        trailing: TextButton.icon(onPressed: (){print("link/${widget.objeto['parceria']['usuario']}");}, icon:Icon(
                      FontAwesomeIcons.instagram,
                      size: 20,
                      
                    ), label: Text("Visitar Perfil"),)
                      )),
                      
                      
                      // ElevatedButton(
                      //   child: const Text('Close'),

                      //   onPressed: () => Navigator.pop(context),
                      // ),
                    ],
                  ),
                ),
    );
  }
}