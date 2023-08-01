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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Nome'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Por favor, insira um nome';
              }
              return null;
            },
            onSaved: (value) => _nome = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Usuário'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Por favor, insira um nome de usuário';
              }
              return null;
            },
            onSaved: (value) => _usuario = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Senha'),
            obscureText: true,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Por favor, insira uma senha';
              }
              return null;
            },
            onSaved: (value) => _senha = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Imagem'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Por favor, insira uma URL de imagem';
              }
              return null;
            },
            onSaved: (value) => _imagem = value!,
          ),
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
          CheckboxListTile(
            title: Text('É Parceiro?'),
            value: _isParceiro ?? false,
            onChanged: (value) {
              setState(() {
                _isParceiro = value!;
              });
            },
          ),
          if (_isParceiro ?? true)
            TextFormField(
              decoration: InputDecoration(labelText: 'Imagem'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Ual';
                }
                return null;
              },
              onSaved: (value) => _imagem = value!,
            ),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Enviar'),
          ),
        ],
      ),
    );
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
    }
  }
}
