import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calc",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePage() {}
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var distancia = TextEditingController();
  //int distancia2 = int.parse(distancia);
  var saida;

  void calc() {
    var saida2 = 1 + 1;
    //if (distancia.text.isEmpty) return;

    setState(() {
      saida = saida2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Combustivel"),
        actions: <Widget>[
          Icon(
            Icons.local_gas_station,
            color: Colors.white,
            size: 40.0,
          ),
        ],
        backgroundColor: Color(0xFF7E58FF),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.5, 1],
            colors: [
              Color(0xFF7E58FF),
              Color(0xFF5CB5E1),
              Color(0xFF7E58FF),
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  new ListTile(
                    title: TextFormField(
                      controller: distancia,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white.withOpacity(0.2),
                        filled: true,
                        labelText: "Distancia",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: TextField(
                controller: saida,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: calc,
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF5CB5E1),
      ),
    );
  }
}
