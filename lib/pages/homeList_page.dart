import 'package:flutter/material.dart';
import '../widgets/perfilVertical.dart';
import '../widgets/perfilHorizontal.dart';

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
              ),
              new SizedBox(
                height: 150,
                child: ListPerfilHorizontal(),
              ),
              new Text("Em alta",
                textAlign: TextAlign.right,),
              new Flexible(
                child: ListPerfilVertical(onSubmit: (p0) => {
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
                      const Text('Modal BottomSheet'),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}