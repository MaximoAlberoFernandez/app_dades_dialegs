import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Agrega 'Key? key' como parámetro del constructor.

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Recuperar el valor d'un camp de text",
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key); // Agrega 'Key? key' como parámetro del constructor.

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
        title: const Text("Recuperar el valor d'un camp de text"), // Corrige el título aquí.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
                    child: Text(myController.text), // Corrige el texto aquí.
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Mostra el valor!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
