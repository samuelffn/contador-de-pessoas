import 'package:flutter/material.dart'; //Liberes necessárias p criação do app. Importando todos widgets do Material design

void main() {
  runApp(MaterialApp(
      //Objeto do tipo MaterialApp, também poderia ser new MaterialApp
      title: "Contador de Pessoas", //title é um parâmetro opcional
      //home: Container(color: Colors.white,) //A tela inicial tb é um widget, ela será um container onde poderemos colocar outros widgets

      //CRIANDO O LAYOUT DA APLICAÇÃO

      home: Home())); //Aqui em home passamos o nosso widget stateful Home criado logo abaixo
}

class Home extends StatefulWidget {
  //Com um widget Statufu é possível modificar valores na tela, ou seja, modificar um widget text por exemplo
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0; //O _ antes do nome da variável é para indicar que esta variável é private
  String _infoText = "Pode Entrar!";

  void _changePeople(int delta) {
    /* Esta função steState é responsável para avisar ao Flutter que
      ele precisa atualizar os dados da tela. Ou seja, informar que o estado da tela foi modificado*/
    setState(() {
      _people += delta;

      if(_people < 0) {
        _infoText = "Mundo invertido?!";
      } else if(_people <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /*Esta função build é chamada sempre que for modificar alguma coisa no nosso layout.
    Por esse motivo recortamos tudo o conteúdo de Stack que estava em home e colamos aqui no return. */
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          //Column é um widget que permite colocar outros widgets um encima do outro na vertical
          mainAxisAlignment: MainAxisAlignment
              .center, //O eixo principal da coluna é na vertical. Centralizar todos os elementos(filhos)
          children: <Widget>[
            //Aqui é passada a lista de widgets
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                      debugPrint("+1"); //Função anônima. Função anônima: () {}
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                      debugPrint("-1");
                    },
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
