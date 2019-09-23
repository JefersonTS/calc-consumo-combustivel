import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora de Combustivel",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController distanciaController = TextEditingController();
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();
  TextEditingController consumoMedio = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _showDialog() {
    // Pegando os valores dos TextFormField e transformando em numeros
    setState(() {
      double distancia = double.parse(distanciaController.text);
      double alcool = double.parse(alcoolController.text);
      double gasolina = double.parse(gasolinaController.text);
      double consumo = double.parse(consumoMedio.text);

      double _infoText = (distancia / consumo) * gasolina;
      double _infoText2 = ((distancia / consumo) * alcool);

      if (_infoText < _infoText2) {
        _infoText3 = "Abasteça com Gasolina! \n\n";
      } else if (_infoText2 < _infoText) {
        _infoText3 = "Abasteça com Alcool! \n\n";
      } else {
        _infoText3 = "Algo de errado não está certo! \n\n";
      }
      _infoText3 += "Quanto pagará em Gasolina: " +
          _infoText.toStringAsPrecision(3) +
          " reais\n\n";
      _infoText3 += "Quanto pagará em Etanol: " +
          _infoText2.toStringAsPrecision(3) +
          " reais\n\n";
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        //retorna o objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Quanto você vai gastar"),
          content: new Text(_infoText3),
          actions: <Widget>[
            // Botao usado para fechar a caixa de dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String _infoText = "Valor gasto em Gasolina";
  String _infoText2 = "Valor gasto em Etanol";
  String _infoText3 = "Qual combustivel compensa mais?";

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
        child: SizedBox.expand(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new ListTile(
                    title: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white.withOpacity(0.2),
                        filled: true,
                        labelText: "Distancia que irá Percorrer",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      controller: distanciaController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira a Distancia!";
                        }
                      },
                    ),
                  ),
                  new ListTile(
                    title: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white.withOpacity(0.2),
                        filled: true,
                        labelText: "Valor do Litro de Gasolina",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      controller: gasolinaController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira o preço da Gasolina!";
                        }
                      },
                    ),
                  ),
                  new ListTile(
                    title: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white.withOpacity(0.2),
                        filled: true,
                        labelText: "Valor do Litro de Etanol",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      controller: alcoolController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira o preço do Etanol!";
                        }
                      },
                    ),
                  ),
                  new ListTile(
                    title: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white.withOpacity(0.2),
                        filled: true,
                        labelText: "Consumo médio do Veiculo 'km/l'",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      controller: consumoMedio,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira um Valor";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 140,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _showDialog();
          }
        },
        child: Icon(Icons.directions_car),
        backgroundColor: Color(0xFF5CB5E1),
      ),
    );
  }
}
