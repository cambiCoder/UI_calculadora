import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String dato = "";
  String resultado = "0";
  List<int> list = [];
  Text texto;
  void _incrementCounter(String number) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      dato = dato + number;
      if (number != "+") {
        this.list.add(int.parse(number));
      }
    });
  }

  void _resultado() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      int valor = this.list[0] + this.list[1];
      resultado = valor.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('$dato',
                    style: TextStyle(color: Colors.white, fontSize: 35))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('$resultado',
                    style: TextStyle(color: Colors.white, fontSize: 40))
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: button("AC", Colors.black87, Colors.teal)),
                  Expanded(child: button("%", Colors.black87, Colors.teal)),
                  Expanded(child: button("(", Colors.black87, Colors.teal)),
                  Expanded(
                      child: button(")", Colors.black87, Colors.amber[900])),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: button("7", Colors.black87, Colors.white)),
                  Expanded(child: button("8", Colors.black87, Colors.white)),
                  Expanded(child: button("9", Colors.black87, Colors.white)),
                  Expanded(
                      child: button("*", Colors.black87, Colors.amber[900])),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: button("4", Colors.black87, Colors.white)),
                  Expanded(child: button("5", Colors.black87, Colors.white)),
                  Expanded(child: button("6", Colors.black87, Colors.white)),
                  Expanded(
                      child: button("-", Colors.black87, Colors.amber[900])),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: button("1", Colors.black87, Colors.white)),
                  Expanded(child: button("2", Colors.black87, Colors.white)),
                  Expanded(child: button("3", Colors.black87, Colors.white)),
                  Expanded(
                      child: button("+", Colors.black87, Colors.amber[900])),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: button("0", Colors.black87, Colors.white)),
                  Expanded(child: button(".", Colors.black87, Colors.white)),
                  Expanded(child: button("/", Colors.black87, Colors.white)),
                  Expanded(
                      child: button("=", Colors.black87, Colors.amber[900])),
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Container button(String number, Color buttonColor, Color textColor) {
    return Container(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          //primary: Colors.black87,
          primary: buttonColor),
      onPressed: () {
        if (number == "=") {
          _resultado();
        } else {
          _incrementCounter(number);
        }
      },
      child: Text(number, style: TextStyle(fontSize: 30, color: textColor)),
    ));
  }
}
