import 'package:SpeechMaster/app/modules/hear/hear_module.dart';
import 'package:SpeechMaster/app/modules/index/index_module.dart';
import 'package:SpeechMaster/app/modules/index/welcome/welcome_page.dart';
import 'package:SpeechMaster/app/modules/speak/speak_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'index_controller.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends ModularState<IndexPage, IndexController> {
  //use 'controller' variable to access controller

  static final List<Widget> _tabs = [
    RouterOutlet(
      module: SpeakModule(),
    ),
    RouterOutlet(
      module: HearModule(),
    ),
    WelcomePage(insideApp: true)
  ];

  final _selectedIndex = BehaviorSubject<int>.seeded(0);

  void _onItemTapped(int index) {
    _selectedIndex.add(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
          stream: _selectedIndex,
          initialData: 0,
          builder: (_, snapshot) => IndexedStack(
            index: snapshot.data,
            children: _tabs,
          )
      ),
      bottomNavigationBar: StreamBuilder<int>(
        stream: _selectedIndex,
        initialData: 0,
          builder: (_, snapshot) => BottomNavigationBar(
            currentIndex: snapshot.data,
            onTap: _onItemTapped,
            backgroundColor: Colors.orange,
            elevation: 8,
            selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
            unselectedIconTheme: IconThemeData(color: Colors.white38, size: 20),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white38,
            showUnselectedLabels: true,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.mic),
                  title: Text('Falar')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.speaker),
                  title: Text('Ouvir')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  title: Text('Grupo')
              ),
            ],
          )
      ),
    );
  }
}
