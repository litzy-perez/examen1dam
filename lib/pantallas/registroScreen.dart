import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final edadController = TextEditingController();
  final institucionController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    correoController.dispose();
    edadController.dispose();
    institucionController.dispose();
    super.dispose();
  }

  void _registrarParticipante() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Datos registrados correctamente')),
      );

      Navigator.pushNamed(
        context,
        '/resumen',
        arguments: {
          'nombre': nombreController.text.trim(),
          'correo': correoController.text.trim(),
          'edad': edadController.text.trim(),
          'institucion': institucionController.text.trim(),
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario de registro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre completo',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese el nombre completo';
                  }
                  if (value.trim().length < 5) {
                    return 'El nombre debe tener al menos 5 caracteres';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese el correo electrónico';
                  }
                  final correo = value.trim();
                  final emailRegex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');
                  if (!emailRegex.hasMatch(correo)) {
                    return 'Ingrese un correo válido (debe contener @ y .)';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: edadController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Edad',
                  prefixIcon: Icon(Icons.cake),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese la edad';
                  }
                  final edad = int.tryParse(value.trim());
                  if (edad == null) {
                    return 'Ingrese un número válido';
                  }
                  if (edad < 15 || edad > 80) {
                    return 'La edad debe estar entre 15 y 80 años';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: institucionController,
                decoration: const InputDecoration(
                  labelText: 'Institución de procedencia',
                  prefixIcon: Icon(Icons.apartment),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese la institución de procedencia';
                  }
                  if (value.trim().length < 5) {
                    return 'Debe tener al menos 5 caracteres';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

              ElevatedButton.icon(
                onPressed: _registrarParticipante,
                icon: const Icon(Icons.check_circle),
                label: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
