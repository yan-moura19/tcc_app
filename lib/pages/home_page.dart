import 'package:flutter/material.dart';
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Modal BottomSheet ${p0}'),
                      Icon(
          FontAwesomeIcons.instagram,
          size: 100,
        ),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
                },),
    );
  }
}
