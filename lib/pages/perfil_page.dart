import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:tcc_app/widgets/form.dart';
import 'package:tcc_app/widgets/loginForm.dart';
class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  bool usuarioSalvo = false;
  var auth;
void initState() {
    super.initState();

    
  }


  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      if(usuarioSalvo)CustomForm(onSubmit: (FormData) {
       
        postUsuario(FormData);
      }),
      if(!usuarioSalvo)LoginForm(onSubmit: (login) {
            
            fazLogin(login);
          },),
      
      
      
      
    ],
  );
  }
}

fazLogin(bodyLogin) async {
  var url = Uri.parse('http://localhost:3000/api/Auth/login');
  final encoding = Encoding.getByName('utf-8');
  final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  var body = bodyLogin;
  body = json.encode(body);
  var response =
  await http.post(url, body: body, encoding: encoding, headers: headers);
  if (response.statusCode == 200) {
    print(response.body);
    
  } else {
    throw Exception('erro');
  }

}
salvaLogin(body) async {
  final prefs = await SharedPreferences.getInstance();
  final chave = 'auth'; 
  
  var valorString = json.encode(body);
  
  await prefs.setString(chave, valorString);
  print('Valor salvo no SharedPreferences: $valorString');
}
Future<String?> recuperarValorDoSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  final chave = 'auth';
  
  
  final valor = prefs.getString(chave);
  
  print('Valor recuperado do SharedPreferences: $valor');
  
  return valor;
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
