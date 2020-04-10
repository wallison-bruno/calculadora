import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculadora(),
  ));
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String output = '0';

  String sub = '0.00';

  String _output = '0';
  double numero1 = 0.0;
  double numero2 = 0.0;
  String operador = '';

  _onPressButton(String rotulo) {
    if (rotulo == 'LIMPAR') {
      setState(() {
        _output = '0';
        numero1 = 0.0;
        numero2 = 0.0;
        operador = '';
        sub = '0.00';
      });
    } else if (rotulo == '+' ||
        rotulo == 'x' ||
        rotulo == '-' ||
        rotulo == '/') {
      numero1 = double.parse(output);

      setState(() {
        sub = double.parse(output).toStringAsFixed(2);
      });
      operador = rotulo;

      _output = '0';
    } else if (rotulo == '.') {
      if (_output.contains('.')) {
      } else {
        _output = _output + rotulo;
      }
    } else if (rotulo == '=') {
      numero2 = double.parse(output);

      if (operador == '+') {
        _output = (numero1 + numero2).toString();
      }
      if (operador == '-') {
        _output = (numero1 - numero2).toString();
      }
      if (operador == 'x') {
        _output = (numero1 * numero2).toString();
      }
      if (operador == '/') {
        _output = (numero1 / numero2).toString();
      }

      setState(() {
        sub = double.parse(_output).toStringAsFixed(2);
      });

      numero1 = 0;
      numero2 = 0;
      operador = '';
    } else {
      _output = _output + rotulo;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget bildButton(String rotulo) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(20),
        child: Text(rotulo,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            )),
        onPressed: () {
          _onPressButton(rotulo);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            child: Text(
              output,
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(
                top: 15,
                right: 20,
              ),
              child: Text(
                sub,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  bildButton('7'),
                  bildButton('8'),
                  bildButton('9'),
                  bildButton('/'),
                ],
              ),
              Row(
                children: <Widget>[
                  bildButton('4'),
                  bildButton('5'),
                  bildButton('6'),
                  bildButton('x'),
                ],
              ),
              Row(
                children: <Widget>[
                  bildButton('1'),
                  bildButton('2'),
                  bildButton('3'),
                  bildButton('-'),
                ],
              ),
              Row(
                children: <Widget>[
                  bildButton('.'),
                  bildButton('0'),
                  bildButton('00'),
                  bildButton('+'),
                ],
              ),
              Row(
                children: <Widget>[
                  bildButton('LIMPAR'),
                  bildButton('='),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
