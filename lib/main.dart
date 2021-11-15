import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter UI Bouton'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _choixBtn = 'Aucun bouton';

  void _quelBouton(String btn) {
    setState(() {
      switch (btn) {
        case 'fab':
          {
            _choixBtn = "FloatingActionButton";
          }
          break;
        case 'elevated':
          {
            _choixBtn = 'ElevatedButton';
          }
          break;
        case 'flat':
          {
            _choixBtn = 'TextButton';
          }
          break;
        case 'icon':
          {
            _choixBtn = 'IconButton';
          }
          break;
        case 'iconCircle':
          {
            _choixBtn = 'IconButton avec fond';
          }
          break;
        case 'outline':
          {
            _choixBtn = 'OutlinedButton';
          }
          break;
        case 'cupertino':
          {
            _choixBtn = 'CupertinoButton';
          }
          break;
      }
    });
  }

  void _fabOnPressed() {
    _quelBouton('fab');
  }

  void _elevatedButtonOnPressed() {
    _quelBouton('elevated');
  }

  void _textButtonOnPressed() {
    _quelBouton('flat');
  }

  void _iconButtonOnPressed() {
    _quelBouton('icon');
  }

  void _iconButtonCircleOnPressed() {
    _quelBouton('iconCircle');
  }

  void _outlinedButtonOnPressed() {
    _quelBouton('outline');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Le bouton appuyé est : ',
            ),
            Text(
              '$_choixBtn',
              style: const TextStyle(
                  color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(30)),
            ElevatedButton(
              onPressed: _elevatedButtonOnPressed,
              child: const Text(
                'ElevatedButton',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.red),
                elevation: MaterialStateProperty.resolveWith((states) => 8),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            TextButton(
              onPressed: _textButtonOnPressed,
              child: const Text(
                'TextButton',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.green),
                shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            IconButton(
              icon: const Icon(Icons.accessibility),
              onPressed: _iconButtonOnPressed,
              color: Colors.blue,
              iconSize: 40,
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Ink(
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: Colors.blueAccent,
              ),
              child: IconButton(
                icon: const Icon(Icons.accessibility_new),
                onPressed: _iconButtonCircleOnPressed,
                color: Colors.white,
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            OutlinedButton(
              onPressed: _outlinedButtonOnPressed,
              child: const Text(
                'OutlinedButton',
                style: TextStyle(color: Colors.deepPurple),
              ),
              style: ButtonStyle(
                side: MaterialStateProperty.resolveWith(
                  (states) => const BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fabOnPressed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
