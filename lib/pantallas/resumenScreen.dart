import 'package:flutter/material.dart';

class ResumenScreen extends StatelessWidget {
  const ResumenScreen({super.key});

  Widget _filaDato(IconData icono, String etiqueta, String valor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 223, 148, 236),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icono, color: Colors.purpleAccent ,),
          const SizedBox(height: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  etiqueta,
                  style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 99, 22, 97)),
                  ),
                  Text(
                  valor,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
              ],
            )
            )
        ],
      ),
    );
  }
   @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: const Text('Resumen de inscripción')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Icon(Icons.check_circle, size: 80, color: Colors.purple),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'INSCRIPCIÓN COMPLETADA',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),

            _filaDato(Icons.person, 'Nombre', args['nombre'] ?? ''),
            _filaDato(Icons.email, 'Correo', args['correo'] ?? ''),
            _filaDato(Icons.cake, 'Edad', args['edad'] ?? ''),
            _filaDato(
              Icons.apartment,
              'Institución',
              args['institucion'] ?? '',
            ),

            const Spacer(),

            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text('Volver al inicio'),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}



