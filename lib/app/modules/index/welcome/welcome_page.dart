import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'welcome_controller.dart';

class WelcomePage extends StatefulWidget {
  final bool insideApp;
  const WelcomePage({Key key, this.insideApp = false}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends ModularState<WelcomePage, WelcomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.insideApp ? 'Grupo' : 'Trabalho Final'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Text('Computação Cognitiva 2', style: TextStyle(fontSize: 20)),
          Text('Interface Baseada em Voz', style: TextStyle(fontSize: 16)),

          SizedBox(height: 16),

          Text('Grupo formado por:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text(
            '''
Bruno Matos dos Santos Ferreira
mat. 1931143072

Paulo Antonio de Faria Filho
mat. 1931143073

Pedro Henrique Ferreira Figueiredo
mat. 1931143071
            ''',
            style: TextStyle(fontSize: 16),
          )

        ],
      ),
      bottomNavigationBar: widget.insideApp ? SizedBox(height: 0) : Container(
        color: Colors.deepOrange,
        padding: EdgeInsets.all(8),
        child: FlatButton(
          color: Colors.deepOrange,
          child: Text('IR PARA O APP', style: TextStyle(color: Colors.white, fontSize: 18)),
          onPressed: () => Modular.to.pushReplacementNamed('/index'),
        ),
      ),
    );
  }
}
