import 'package:flutter/material.dart';

class MyBody extends StatefulWidget {
  @override
  createState() => new MyBodyState();
}

class MyBodyState extends State<MyBody> {
  List<String> _array = [];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, i){
      print('num $i : нечетное = ${i.isOdd}');

      if(i.isOdd) return new Divider();

      final int index = i ~/ 2;

      print('index $index');
      print('length ${_array.length}');

      if (index >= _array.length) _array.addAll(['$index', '${index + 1}', '${index + 2}']);

      return new ListTile(title: new Text(_array[index]));
    });
  }
}

void main() =>  runApp(
    new MaterialApp(
      title: 'Бесконечный список',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: new Scaffold(appBar: AppBar(title: const Text('Список элементов')),body: new Center(child: new MyBody(
        ),))
    )
);