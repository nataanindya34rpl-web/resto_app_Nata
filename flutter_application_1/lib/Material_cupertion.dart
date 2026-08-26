import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyCupertino extends StatelessWidget {
  const MyCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Container(
        margin: EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            AppBar(title: Text('Contoh Cupertino')),
            MaterialButton(child: Text("Contoh button"), onPressed: () {}),
            CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }
}