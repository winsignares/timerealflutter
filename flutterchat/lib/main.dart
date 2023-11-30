import 'package:flutter/material.dart';
import 'package:flutterchat/chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulario de Salas'),
        ),
        body: SalaFormulario(),
      ),
    );
  }
}

class SalaFormulario extends StatefulWidget {
  @override
  _SalaFormularioState createState() => _SalaFormularioState();
}

class _SalaFormularioState extends State<SalaFormulario> {
  final List<String> salas = ["Sala 1", "Sala 2", "Sala 3", "Sala 4", "Sala 5"];
  String seleccionSala = "Sala 1";
  final TextEditingController nombreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: seleccionSala,
              onChanged: (String? value) {
                setState(() {
                  seleccionSala = value!;
                });
              },
              items: salas.map((String sala) {
                return DropdownMenuItem<String>(
                  value: sala,
                  child: Text(sala),
                );
              }).toList(),
              decoration:
                  const InputDecoration(labelText: 'Selecciona una Sala'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Acciones al enviar el formulario
                print('Nombre: ${nombreController.text}');
                print('Sala seleccionada: $seleccionSala');
                // Navegar al widget de chat al presionar el botón
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatWidget()),
                    );
              },
              child: const Text('Enviar'),
              
            ),
          ],
        ),
      ),
    );
  }
}
