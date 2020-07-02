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

  @override
  void initState() {
    controller.checkRecordPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fala que eu te escuto!'),
      ),
      body: Column(
        children: <Widget>[
          Observer(builder: (_){
            if (controller.loading) {
              return Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }else {
              if (controller.hasPermission) {
                return Expanded(
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(Radius.circular(200))
                      ),
                      child: InkWell(
                        child: Observer(builder: (_) {
                          if (controller.initializing) {
                            return CircularProgressIndicator();
                          }else {
                            if (controller.isRecording) {
                              return Icon(Icons.stop, size: 160);
                            }
                            return Icon(Icons.mic, size: 160);
                          }
                        }),
                        onTap: (){
                          if (controller.isRecording) {
                            controller.onStop();
                          }else {
                            controller.onRecord();
                          }
                        },
                      ),
                    ),
                  ),
                );
              }else {
                return Text('Sem permissão!');
              }
            }
          }),
          Observer(builder: (_) {
            if (controller.alternatives != null && controller.alternatives.isNotEmpty) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Texto reconhecido:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(controller.alternatives.first.transcript, style: TextStyle(fontSize: 16))
                  ],
                ),
              );
            }
            return Container();
          })
        ],
      ),
    );
  }
}
