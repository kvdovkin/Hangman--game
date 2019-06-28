import 'dart:html' as prefix0;

import 'package:flutter_web/material.dart';
import 'package:flutter_web_ui/ui.dart' as prefix1;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Hangman'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset('Hangman.png'),
            Text(title),
            Text('!')
          ],
        ),
      ),
      body: _renderBody(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _renderBody() {
    return Container(
      decoration: BoxDecoration(color: Color(0xEEEEEE)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             _renderGallows(),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.all(25.0),
              width: 640,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Вопрос 1 из 20'),
                  Text('Способность объекта скрывать свое внутреннее устройство, согласно которому объект рассматривается как черный ящик, называется:'),
                  Radio(activeColor: Colors.green),
                  Radio(activeColor: Colors.green),
                  Radio(activeColor: Colors.green, value: null)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
      
        Widget _renderGallows() => Image.asset("Gallows.png");
        Widget _renderMistake1() => Image.asset('Mistake-1.png');
      
        color(int i) {}
}
