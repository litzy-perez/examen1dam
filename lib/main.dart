import 'package:flutter/material.dart';
import 'pantallas/inicioScreen.dart';
import 'pantallas/registroScreen.dart';
import 'pantallas/resumenScreen.dart';

void main() {
  runApp(const RegistroCapacitacionApp());
}

class RegistroCapacitacionApp extends StatelessWidget {
  const RegistroCapacitacionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de capacitaciones',
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 254, 111, 252),
        useMaterial3: true,
      ),
      home: const InicioScreen(),
      routes: {
        '/registro': (context) => const RegistroScreen(),
        '/resumen': (context) => const ResumenScreen(),
        },
      );
  }
}
