import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
   final Function(Map<String, dynamic>) onSubmit;

  LoginForm({required this.onSubmit});
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool manterConectado = false;
  final usuario = TextEditingController();
  final senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(20),
      margin:   EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),

        
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: usuario,
            decoration: InputDecoration(
              hintText: 'Nome de Usuário',
              icon: Icon(Icons.person),
            ),
            validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira uma senha';
                  }
                  return null;
                },
           
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: senha,
            decoration: InputDecoration(
              hintText: 'Senha',
              icon: Icon(Icons.lock),
            ),
            validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira uma senha';
                  }
                  return null;
                },
            obscureText: true,
            

          ),
          SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: manterConectado,
                onChanged: (value) {
                  setState(() {
                    manterConectado = value!;
                  });
                },
              ),
              Text('Manter Conectado'),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _submitForm();
              // Adicione a lógica de autenticação aqui
              
            },
            child: Text('Entrar'),
          ),
        ],
      ),
    );
  }
  void _submitForm() {
    Map<String, dynamic> body = {
        'usuario': usuario.text,
        'senha': senha.text,
        'conectado': manterConectado
  };
  widget.onSubmit(body);
  }

}