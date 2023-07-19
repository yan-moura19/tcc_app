import 'package:flutter/material.dart';
class Screen2 extends StatelessWidget {
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
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(categories[index]),
        );
      },
    );
  }
}