import 'dart:html' as prefix0;

import 'package:flutter_web/material.dart';
import 'package:flutter_web_ui/ui.dart' as prefix1;

void main() => runApp(MyApp());
enum SingingCharacter { lafayette, jefferson }


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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SingingCharacter _character = SingingCharacter.lafayette;

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
            Text(widget.title),
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
          children: <Widget>[
              _renderGallows(),
              RadioListTile<SingingCharacter>(
                  title: const Text('Lafayette'),
                  value: SingingCharacter.lafayette,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) { setState(() { _character = value; }); },
              ),
              RadioListTile<SingingCharacter>(
                title: const Text('Thomas Jefferson'),
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter value) { setState(() { _character = value; }); },
              ),
          ],
        )
      )
    );
  }

        Widget _renderGallows() => Image.asset("Gallows.png");

        Widget _renderMistake1() => Image.asset('Mistake-1.png');

        color(int i) {}
}
