import 'package:flutter/material.dart';
import 'package:barra_project/screen/barraNav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarraNav(), // Usa el nombre de clase correcto
      theme: ThemeData(
        // Configura un tema básico si lo deseas
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}