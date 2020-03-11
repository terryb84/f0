import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        buttonColor: Colors.purple,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Report List'),
        ),
        body: ListView.builder(itemBuilder: _itemBuilder,
        itemExtent: 60,
        itemCount: _kittens.length,),
      ),
    );
  }


  Widget _itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(context: context,
      builder: (context) => _dialogBuilder(context, _kittens[index])),
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        alignment: Alignment.centerLeft,
        child: Text(_kittens[index].name,
        style: Theme.of(context).textTheme.headline),
      ),
    );
  }

  _dialogBuilder(BuildContext context, Kitten kitten) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
          Image.asset(kitten.imageUrl, fit:BoxFit.fill),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Text(kitten.name, style: localTheme.textTheme.display1,),

              Text('${kitten.age}', style: localTheme.textTheme.subhead.copyWith(
                 fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 16.0),
              Text(kitten.description,
                style:localTheme.textTheme.body1,
              ),
              SizedBox(height:16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: [
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: const Text('I\'m Allegic'),
                    ),
                    RaisedButton(
                      onPressed: (){},
                      child: const Text('Adopt'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ],
    );
  }
}

class Kitten{
  const Kitten({this.name, this.description, this.age, this.imageUrl});
  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final String server = debugDefaultTargetPlatformOverride == TargetPlatform.android ? "10.0.2.2" : "localhost";

final List<Kitten> _kittens = <Kitten>[
  Kitten(
    name:'Mittens',
    description: 'this is description',
    age:3,
    imageUrl:'assets/1.png' ,
  ),
  Kitten(
    name:'aa',
    description: 'this is description',
    age:3,
    imageUrl:'assets/1.png' ,
  ),

  Kitten(
    name:'bb',
    description: 'this is description',
    age:3,
    imageUrl:'assets/1.png' ,
  ),

  Kitten(
    name:'cc',
    description: 'this is description',
    age:3,
    imageUrl:'assets/1.png' ,
  ),

];