import 'package:flutter/material.dart';

class MyForm extends StatefulWidget{
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State{
  final _formKey = GlobalKey<FormState>();

  dynamic width;
  dynamic height;
  dynamic area;


  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10.0),
      child:
      Form(
        key: _formKey,
        child:
        Column(
          children: <Widget>[

            const Text('Ширина(мм)', style: TextStyle(fontSize: 10.0),),

            TextFormField(validator: (value){
              if (value!.isEmpty) return 'Задайте ширину';
              width = int.parse(value);
            }),

            const SizedBox(height: 20.0),

            Column(
          children: <Widget>[

            const Text('Высота(мм)', style: TextStyle(fontSize: 10.0),),

            TextFormField(validator: (value){
              if (value!.isEmpty) return 'Задайте высоту';
              height = int.parse(value);
            }),

            const SizedBox(height: 20.0),

            ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  setState(() {
                    if (width is int && height is int) area = width * height;
                  });
                }
              },child: Text('Вычислить', style: TextStyle(color: Colors.white)),
            ),

            const SizedBox(height: 50.0),

            Text(area == null ? 'Задайте параметры' : 'S = $width * $height = ${area} (мм2)', style: TextStyle(fontSize: 30.0),) 
          ]
        )
          ]
        )
      )
    );
  }
}

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text('Калькулятор площади')),
      body: const MyForm()
    )
  )
);