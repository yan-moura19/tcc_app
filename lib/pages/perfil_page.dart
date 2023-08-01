import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tcc_app/widgets/form.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomForm(onSubmit: (FormData) {
        print(FormData);
      }),
    );
  }
}
