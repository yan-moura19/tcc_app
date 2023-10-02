import 'package:flutter/material.dart';
import 'package:tcc_app/widgets/modal.dart';
import '../widgets/perfilVertical.dart';
import '../widgets/perfilHorizontal.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text("Para você",
              textAlign: TextAlign.start,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                
                color: Color.fromARGB(255, 0, 0, 0),
              ),
         ),
              new SizedBox(
                height: 150,
                child: ListPerfilHorizontal(onSubmit: (p0) => {
                  showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: ModalWidget(objeto: p0),
              );
            },
          )
                },),
              ),
              new Text("Em alta",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                
                color: Color.fromARGB(255, 0, 0, 0),
              ),
                textAlign: TextAlign.right,),
              new Flexible(
                child: ListPerfilVertical(onSubmit: (p0) => {
                  showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: ModalWidget(objeto: p0),
              );
            },
          )
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}