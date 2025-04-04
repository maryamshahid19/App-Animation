import 'package:app_animation/logo_animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade In Logo Animation',
      home: LogoAnimation(),
    );
  }
}
