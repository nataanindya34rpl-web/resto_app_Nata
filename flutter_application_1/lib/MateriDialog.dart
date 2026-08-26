import 'package:flutter/material.dart';

class MyDialogPage extends StatelessWidget {
  const MyDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Text('Show alert'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text('OK'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("My title"),
    content: const Text('Sobat Kemucing.'),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}