import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tcc_app/pages/home_page.dart';
import 'package:tcc_app/pages/categorias_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1c1f30),
        leading: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.network(
                 'https://cdn-icons-png.flaticon.com/512/8336/8336946.png',
                  fit: BoxFit.contain,
                  height: 40,
              ),
              
            ],

          ),
        
        title: Text("Tcc APP"),
        actions: [
            if (currentIndex == 2)
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print(currentIndex);
                },
              ),
          ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        
        showSelectedLabels: false, // Esconde o rótulo do item selecionado
        showUnselectedLabels: true,
        backgroundColor: Color(0xFF151721),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_list_outlined,
            ),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(
            Icons.perm_identity,
          ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}





class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tela 3 - Perfil'),
    );
  }
}