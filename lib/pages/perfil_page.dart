import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:tcc_app/widgets/form.dart';
import 'package:tcc_app/widgets/loginForm.dart';
class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  bool usuarioSalvo = false;

  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Visibility(
        visible: usuarioSalvo,
        child: Container(
          child:  CustomForm(onSubmit: (FormData) {
       
        postUsuario(FormData);
      }),
      ),
        ),
      
      Visibility(

        visible: !usuarioSalvo,
        child: Container(
          child: LoginForm(onSubmit: (login) {
            print("-------");
            print(login);
          },),
        ),
      )
      ,
    ],
  );
  }
}

postUsuario(bodyPost) async {
  var url = Uri.parse('http://localhost:3000/api/usuario');
  final encoding = Encoding.getByName('utf-8');
  final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  var body = bodyPost;
  body = json.encode(body);
  var response =
      await http.post(url, body: body, encoding: encoding, headers: headers);
  if (response.statusCode == 200) {
    print("usuário cadastrado");
  } else {
    throw Exception('Não foi possivel criar perfil');
  }
}
