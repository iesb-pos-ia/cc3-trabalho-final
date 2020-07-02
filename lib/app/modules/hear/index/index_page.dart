import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'index_controller.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends ModularState<IndexPage, IndexController> {
  //use 'controller' variable to access controller

  void _sendText(BuildContext context) {
    _focusNode.unfocus();
    controller.send();
  }

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escreve que eu te falo!'),
      ),
      body: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16/10,
            child: Container(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                focusNode: _focusNode,
                controller: controller.editingController,
                maxLines: 100000,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.text,
                enableSuggestions: false,
                enableInteractiveSelection: false,
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(
                  labelText: 'Digita um texto aí!',
                ),
                textInputAction: TextInputAction.send,
                onSaved: (_) => _sendText(context),
              ),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              RaisedButton.icon(
                icon: Icon(Icons.send),
                label: Text('ENVIAR'),
                onPressed: () => _sendText(context),
              )
            ],
          ),
          Observer(builder: (_){
            if (controller.loading) {
              return CircularProgressIndicator();
            }
            if (controller.filePath != null) {
              _focusNode.unfocus();
              return IconButton(
                icon: controller.isPlaying ? Icon(Icons.stop, size: 64) : Icon(Icons.play_arrow, size: 64),
                onPressed: () {
                  if (controller.isPlaying) {
                    controller.stop();
                  }else {
                    controller.play();
                  }
                },
              );
            }
            return Container();
          })
        ],
      ),
    );
  }
}
