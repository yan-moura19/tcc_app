import 'package:flutter/material.dart';
import 'package:tcc_app/widgets/modal.dart';
import 'package:tcc_app/widgets/perfilHorizontal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/perfilVertical.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListPerfilVertical(onSubmit: (p0) => {
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
    );
  }
}
