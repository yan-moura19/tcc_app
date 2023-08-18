import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multiselect/multiselect.dart';

class CustomForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  CustomForm({required this.onSubmit});

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _usuario = '';
  String _senha = '';
  List<String> _categorias = [];
  List<String> _topCategorias = [];
  String _imagem = '';
  String _teste = '';
  bool _isParceiro = false;
  List<String> _preferencias = [];
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
  void limparLista() {
    setState(() {
      _nome = ' ';
      _usuario = ' ';
      _senha = ' ';
      _categorias.clear();
      _topCategorias.clear();
      _imagem = '';
      _teste = '';
      _isParceiro = false;
      _preferencias.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          color: Colors.white,
          constraints: BoxConstraints(
              maxWidth: 400), // Ajuste a largura máxima conforme necessário
          child: ListView(
            children: [
              SizedBox(width: 5, height: 15),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nome',
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12)),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
                onSaved: (value) => _nome = value!,
              ),
              SizedBox(width: 5, height: 15),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Usuário',
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12)),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira um nome de usuário';
                  }
                  return null;
                },
                onSaved: (value) => _usuario = value!,
              ),
              SizedBox(width: 5, height: 15),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Senha',
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12)),
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira uma senha';
                  }
                  return null;
                },
                onSaved: (value) => _senha = value!,
              ),
              SizedBox(width: 5, height: 15),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Imagem',
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12)),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira uma URL de imagem';
                  }
                  return null;
                },
                onSaved: (value) => _imagem = value!,
              ),
              SizedBox(width: 5, height: 15),
              DropDownMultiSelect(
                options: categories,
                selectedValues: _categorias,
                onChanged: (value) {
                  setState(() {
                    _categorias = value;
                  });
                  print('you have selected $_categorias fruits.');
                },
              ),
              SizedBox(width: 5, height: 15),
              CheckboxListTile(
                title: Text('É Parceiro?'),
                value: _isParceiro ?? false,
                onChanged: (value) {
                  setState(() {
                    _isParceiro = value!;
                  });
                },
              ),
              SizedBox(width: 5, height: 15),
              if (_isParceiro ?? true)
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Imagem',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12)),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Ual';
                    }
                    return null;
                  },
                  onSaved: (value) => _imagem = value!,
                ),
              SizedBox(width: 5, height: 15),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                onPressed: _submitForm,
                child: Text('Enviar'),
              ),
            ],
          ),
        ));
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      // Cria um mapa com os valores dos campos
      Map<String, dynamic> formData = {
        'nome': _nome,
        'usuario': _usuario,
        'senha': _senha,
        'categorias': _categorias,
        'topCategorias': _topCategorias,
        'imagem': _imagem,
        'isParceiro': _isParceiro,
        'preferencias': _preferencias,
      };

      widget.onSubmit(formData);
      limparLista();
    }
  }
}
