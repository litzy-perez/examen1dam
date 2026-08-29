import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CAPACITACION TECNOLOGICA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/descarga.jpg',
              height: 140,
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.laptop_chromebook, size: 30),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Formación Tecnológica',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: 25),
            const Text(
              'Registro de Capacitaciones Tecnologicas',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),
            const Text(
              'Registras tus datos para participar para nuestra actividades de formacion',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.how_to_reg),
                label: const Text('Registrar participante'),
                onPressed: () {
                  Navigator.pushNamed(context, '/registro');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
