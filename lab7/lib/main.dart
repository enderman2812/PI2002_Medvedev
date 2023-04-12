import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);


@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: const Text('Возвращение значения')),
    body: Center(child: ElevatedButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
      },
      child: const Text('Приступить к выбору...')))
    );
  }
}

class SecondScreen extends StatelessWidget{
  const SecondScreen({Key? key}) : super(key: key);


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Второе окно'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('Да!'),));
            }, child: const Text('Да')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('Да!'),));
            }, child: const Text('Нет')),
          ],
        )
      )
    );
  }
}

void main(){
  runApp(const MaterialApp(
    home: MainScreen(),
  ));
}