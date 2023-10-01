import 'package:flutter/material.dart';

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
  String _categoria = 'Roupas';
  List<String> _categorias = [];
  List<String> _topCategorias = [];
  String _imagem = '';
  String _teste = '';
  bool _isParceiro = false;
  List<String> _preferencias = [];
  List<String> categories = [
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
             ), // Ajuste a largura máxima conforme necessário
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
              Text("Escolha uma categoria de sua preferência:"),
              DropDownMultiSelect(
                options: categories,
                selectedValues: _preferencias,

                onChanged: (value) {
                  setState(() {
                    _preferencias = value;
                  });
                  print('you have selected $_preferencias fruits.');
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
              
              if (_isParceiro ?? true) SizedBox(width: 5, height: 15),
              if (_isParceiro ?? true)
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
               if (_isParceiro ?? true)SizedBox(width: 5, height: 15),
               if (_isParceiro ?? true)DropdownMenu<String>(
                initialSelection: categories.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    _categoria = value!;
                    print(value!);
                  });
                },
                dropdownMenuEntries: categories.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
              SizedBox(width: 5, height: 15),
              
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
      var formData;
      print("passou");
      if(_isParceiro){
         Map<String, dynamic> body = {
        'nome': _nome,
        'senha': _senha,
        'imagem': _imagem,
        'preferencias': _preferencias,
        'isParceiro': _isParceiro,
        'usuario': _usuario,
        'categoria': _categoria,
        
      };
      formData = body;
      }else{
         Map<String, dynamic> body = {
        'nome': _nome,
        'senha': _senha,
        'imagem': _imagem,
        'preferencias': _preferencias,
        'isParceiro': _isParceiro,
        
      };
      formData = body;

      }
      print(formData);
     

      widget.onSubmit(formData);
      limparLista();
    }
  }
}
