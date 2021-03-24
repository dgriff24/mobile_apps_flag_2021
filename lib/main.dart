import 'package:flutter/material.dart';

import 'texan_flag_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Texan Flag!',
      home: TexanFlagDemo(),
    );
  }
}
