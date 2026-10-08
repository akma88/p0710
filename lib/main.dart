import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Vanilla demo", home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _rating = 50;

  @override
  Widget build(BuildContext context) {
    double size = 50;

    return Scaffold(
      appBar: AppBar(title: const Text('Vanilla Demo')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: (_rating >= 2
                  ? Icon(Icons.star, size: size)
                  : Icon(Icons.star_border, size: size)),
              color: Colors.indigo[500],
              iconSize: size,
              onPressed: () {
                setState(() {
                  _rating = 1;
                });
              },
            ),
            IconButton(
              icon: (_rating >= 2
                  ? Icon(Icons.star, size: size)
                  : Icon(Icons.star_border, size: size)),
              color: Colors.indigo[500],
              iconSize: size,
              onPressed: () {
                setState(() {
                  _rating = 2;
                });
              },
            ),
            IconButton(
              icon: (_rating >= 3
                  ? Icon(Icons.star, size: size)
                  : Icon(Icons.star_border, size: size)),
              color: Colors.indigo[500],
              iconSize: size,
              onPressed: () {
                setState(() {
                  _rating = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
