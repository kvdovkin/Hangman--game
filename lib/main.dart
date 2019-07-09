import 'dart:html' as prefix0;

import 'package:flutter_web/material.dart';
import 'package:flutter_web_ui/ui.dart' as prefix1;

void main() => runApp(MyApp());
enum SingingCharacter { none, first, second, third, fourth, fifth }
int question_number = 0;
int error_number = 0;
List<String> questions = [
  "Способность объекта скрывать свое внутреннее устройство, согласно которому объект рассматривается как черный ящик, называется",
  "Интерфейс класса определяется",
  "Конструктор класса это",
  "Может ли метод, объявленный константным, изменять данные класса?",
  "Зачем нужен деструктор класса?",
  "При каком типе наследования класс-потомок наследует интерфейс класса-родителя?",
  "Вместо наследования реализации во многих случаях может оказаться лучше использовать",
  "Зачем объявлять методы класса виртуальными?",
  "Что нужно сделать разработчику на C++, если он не хочет, чтобы от его класса наследовались?",
  "Можно ли создать экземпляр абстрактного класса?",
  "Может ли порожденный класс обладать свойствами сразу нескольких родительских классов?",
  "Почему ромбовидное наследование - плохо?",
  "Как можно избавиться от оператора switch-case?",
  "Самая сильная взаимосвязь между классами в C++ достигается через:",
  "Может ли объект класса 1 получить доступ к приватным данным объекта класса 2?",
  "Можно ли применить арифметическую операцию между объектами разных типов?",
  "Зачем нужен умный указатель?",
  "Какая разница между префиксным и постфиксным унарным плюсом?",
  "К чему приводит использование обобщённого программирования?",
  "Можно ли с помощью шаблонов проводить длительные вычисления на этапе компиляции?", 
];
List<List<String>> answers = [
  ["Абстракция","Инкапсуляция ","Интерфейс","Полиморфизм"], 
  ["Его публичными методами и данными ","Его защищенными методами и данными","Его закрытыми методами и данными","Его конструктором","Его деструктором"], 
  ["Специальный метод класса, выполняющий освобождение занимаемых объектом ресурсов","Его базовый класс","Специальный метод класса, выполняющий инициализацию начального состояния объекта ","Список инициализации","Программист, выполняющий разработку и проектирование внутреннего устройства класса"], 
  ["Не может","Может","Не может изменять данные, объявленные константными","Может изменять данные, объявленные мутабельными"], 
  ["Освободить единолично занимаемые ресурсы ","Уведомить систему о разрушении объекта","Предотвратить неконтролируемое разрушение объекта","Отправить сообщение в консоль в особом формате"], 
  ["Публичное наследование ","Защищенное наследование","Приватное наследование"], 
  ["Полиморфизм","Композицию ","Наследование интерфейса","Защищённое наследование"], 
  ["Для поддержки виртуальных переменных","Такие методы имеют возможность изменять данные текущего класса из класса-наследника","Так требует стандарт C++17","Для возможности задать альтернативную реализацию в классе-наследнике "], 
  ["Не объявлять деструктор класса виртуальных ","Объявить конструктор класса приватным","Приватно унаследовать класс от пустого класса","Объявить конструктор класса как final"], 
  ["Да","Нет "], 
  ["Да, для этого есть полиморфизм","Нет","Да, для этого можно применить множественное наследование ","Да, для этого можно объявить методы чисто виртуальными"], 
  ["Компилятор генерирует код для каждой ветки наследования, что приводит к 'разбуханию' кода","Не понятно, реализацию какого из родителей нужно использовать в дочернем классе ","Компиляция попадёт в вечный цикл из-за круговой зависимости","Это не плохо, просто требует большей квалификации программиста"], 
  ["С помощью наследования реализации","С помощью инкапсуляции","С помощью полиморфизма"], 
  ["отношение дружбы ","наследование","композицию"], 
  ["Нет, на то эти данные и приватные","Да, если класс 1 приватно унаследован от класса 2","Да, если класс 1 объявлен дружественным по отношению к классу 2"], 
  ["Нет","Да "],  
  ["Он инкапсулирует в себе ответственность освобождения занимаемых ресурсов объекта ","Он оптимизирует работу с памятью оборачиваемого объекта","Он предотвращает ошибку обращения к несуществующим данным по указателю"],  
  ["Префиксный возвращает новое значение, менее производительно","Префиксный возвращает старое значение, менее производительно","Префиксный возвращает новое значение, более производительный ","Префиксный возвращает старое значение, более производительный"],  
  ["более 'раздутый' код программиста, но, возможно, более компактный бинарный код","более компактный код программиста, и более производительный бинарный код","более компактный код программиста, но, возможно, более 'раздутый' бинарный код ","более 'раздутый' код программиста, но, возможно, более производительный бинарный код"],  
  ["Да","Нет"],  
];
List<int> true_answers = [2,1,3,4,1,1,2,4,1,2,3,2,3,1,3,2,1,3,3,1];
List<Color> bgcs = [Color(0x00000000),Color(0x22000000),Color(0x44000000),Color(0x66000000),Color(0x88000000),Color(0xAA000000),Color(0xCC000000),Color(0xEE000000)];
 
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
  SingingCharacter _character = SingingCharacter.none;

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
            Text("   " + widget.title),
            Text('!')
          ],
        ),
      ),
      body: _renderBody(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  givemeachance() {
    setState(() {
      question_number=0;error_number=0;
    });
  }

  Widget _renderBody() { 
    print("question_number=$question_number");
    if(question_number >= 20 && error_number < 7) { 
      return Container( 
        padding: EdgeInsets.all(50.0), 
        child: Center(
          child: Column(
            children: <Widget>[ 
              Image.asset("win.png"),
              Container(padding: EdgeInsets.all(25.0),), 
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                  BoxShadow(
                  blurRadius: 13.0,
                  color: Colors.black.withOpacity(.5),
                  offset: Offset(6.0, 7.0),
                  )
                ]
              ),
              child:Container(
                padding: EdgeInsets.all(25.0),
                decoration: BoxDecoration(color: Colors.white), 
                width: 660, 
                child: Center(
                  child: Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      Text('Победа!',
                        style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: 'Calibri',
                      )),
                      Text("Теперь, возможно, вы сможете получить 4-ку по ООП Малова",
                        style: new TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Calibri',
                        color: Colors.grey
                      )), 
                    ],
                  ),
                ),
              )
              ), 
            ],
          )
        )
      );  
    } else if(question_number >= 20 || error_number >= 7) {
      return Container( 
        padding: EdgeInsets.all(50.0),
        decoration: BoxDecoration(color: bgcs[6]),
        child: Center(
          child: Column(
            children: <Widget>[ 
              Image.asset("Mistake-6.png"),
              Container(padding: EdgeInsets.all(25.0),), 
              Container(
                padding: EdgeInsets.all(25.0),
                decoration: BoxDecoration(color: Colors.white), 
                width: 380, 
                child: Center(
                  child: Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      Text('Поражение',
                        style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: 'Calibri',
                      )),
                      Text("Не видать тебе 4-ки по ООП Малова",
                        style: new TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Calibri',
                        color: Colors.grey
                      )),
                      Container(padding: EdgeInsets.all(10.0)), 
                     /* Container( padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 13.0,
                            color: Colors.black.withOpacity(.5),
                            offset: Offset(6.0, 7.0),
                          ),
                        ]),
                        child:*/RaisedButton(
                          child: Text("ДАЙТЕ МНЕ ЕЩЁ ШАНС",
                            style: new TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Calibri', 
                            color: Colors.white,
                          )),
                          onPressed: givemeachance,
                          color: Colors.green, 
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          splashColor: Colors.grey,
                        //),
                      ),
                    ],
                  ),
                ),
              ), 
            ],
          )
        )
      );  
    } else {
      return Container( 
        padding: EdgeInsets.all(50.0),
        decoration: BoxDecoration(color: error_number < 7 ? bgcs[error_number] : bgcs[0]),
        child: Center(
          child: Column(
            children: <Widget>[ 
              _renderMistake(),
              Container(padding: EdgeInsets.all(25.0),), 
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                  BoxShadow(
                  blurRadius: 13.0,
                  color: Colors.black.withOpacity(.5),
                  offset: Offset(6.0, 7.0),
                  )
                ]
              ),
              child:Container(
                padding: EdgeInsets.all(25.0),
                decoration: BoxDecoration(color: Colors.white), 
                width: 640,  
                child: Center(
                  child: Column(
                    children: <Widget>[
                      _mainq()           
                    ],
                  ),
                ),
              )
              ), 
            ],
          )
        )
      );
    }
  } 
 
  Widget _renderRadioListTile(SingingCharacter sc, int nq) { 
      if(nq < answers[question_number].length && question_number < 20) {
        _character = SingingCharacter.none;
        return Container(
          child: Center(
            child: Column(
              children: <Widget>[ 
                RadioListTile<SingingCharacter>(
                  title: Text(answers[question_number][nq],
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Calibri' 
                  )),
                  value: sc,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) { 
                    setState(() { 
                      _character = value;  
                      if (nq + 1 != true_answers[question_number]) error_number++;
                      if (_character != SingingCharacter.none) question_number++; 
                      print(error_number);
                    }
                  ); 
                },
              ),
            ],
          )
        )
      );
    }else{
      return Container();
    }
  }
 
  Widget _mainq() { 
    if(question_number < 20) {
      return Container(
        child: Center( 
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[ 
              Container( 
                child: Row(
                  children: <Widget>[
                    Text('Вопрос ' + (question_number + 1).toString(),
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Calibri',
                      )
                    ),
                    Text(' из 20',
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Calibri',
                        color: Colors.grey
                      )
                    )
                  ]
                )
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0
                ),
                child:
                  Text(questions[question_number] + ":",
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Calibri',
                      color: Colors.grey
                    ),
                  )),           
              _renderRadioListTile(SingingCharacter.first,0),
              _renderRadioListTile(SingingCharacter.second,1),
              _renderRadioListTile(SingingCharacter.third,2),
              _renderRadioListTile(SingingCharacter.fourth,3),   
            ]
          )
        )  
      );
    } else {
      return Container();
    }
  }
 
  Widget _renderMistake() { 
    if(error_number == 0) {
      return Image.asset("Gallows.png");  
    } else if (error_number < 7){
      if (question_number == 20) Image.asset('win.png');
      return Image.asset('Mistake-' + error_number.toString() + '.png');
    } else {
      question_number = 999;
      return Container();
    }
  }
}
