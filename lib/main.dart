import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Recuperar el valor d'un camp de text",
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuperar el valor d'un camp de text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return SimpleDialog(
                    title: const Text('Choose your option'),
                    children: [
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(myController.text),
                      ),
                    ],
                  );
                },
              );
            },
            tooltip: 'Mostra el valor!',
            child: const Icon(Icons.text_fields),
          ),
          const SizedBox(height: 16), // Espacio entre los botones.
          OutlinedButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Texto en el campo de texto'),
                    content: Text(myController.text),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Mostrar Texto'),
          ),
        ],
      ),
    );
  }
}
