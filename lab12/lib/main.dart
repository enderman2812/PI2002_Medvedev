import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Demo';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

enum CoffeeCharacter {espresso, capuccino}
CoffeeCharacter? coffee = CoffeeCharacter.espresso;

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Coffee Machine'),
          backgroundColor: Colors.brown,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.coffee),
              ),
              Tab(
                icon: Icon(Icons.local_shipping),
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    color: Colors.lime,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                Text('Beans: 250', style: TextStyle(color: Colors.grey)),
                Text('Milk: 250', style: TextStyle(color: Colors.grey)),
                Text('Water: 250', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 245, 253, 158),
                  height: 185,
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Text('Coffee Maker', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text('Your money: 0', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.grey))
                    ],
                    ),
                ),
                ],
                ),
                ),
                Container(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                  title: Text('Espresso'),
                  leading: Radio<CoffeeCharacter>(
                    value: CoffeeCharacter.espresso,
                    groupValue: coffee,
                    onChanged: (CoffeeCharacter? value) {
                    },
                  ),
                ),
                ListTile(
                  title: Text('Capuccino'),
                  leading: Radio<CoffeeCharacter>(
                    value: CoffeeCharacter.capuccino,
                    groupValue: coffee,
                    onChanged: (CoffeeCharacter? value) {
                    },
                  ),
                ),
                  ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 0, 150, 136))),
                      child: Icon(Icons.play_arrow, color: Colors.black),
                    ),
                  ],
                  ),
                  ],
                )),
                SizedBox(height: 20),
                Divider(color: Color.fromARGB(255, 218, 218, 218)),
                SizedBox(height: 20),
                Container(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(readOnly: true,
                      initialValue: 'Put money here', style: TextStyle(color: Colors.grey, fontSize: 14),
                      validator: (value){
                      if(value!.isEmpty) return 'Put money here';
                    }),
                    SizedBox(height: 10),
                    ButtonBar(
              mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(const Color.fromARGB(255, 197, 225, 165)), ),
                    child: Icon(Icons.monetization_on, color: Colors.black),
                  ),

                  ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(const Color.fromARGB(255, 244, 143, 177)),),
                    child: Icon(Icons.money_off, color: Colors.black),
                  ),
                ],
            ),
                  ],
                ))
                ],
              ),
              ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    color: Colors.lime,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 245, 253, 158),
                  height: 257,
                  child: Column(
                    children: [
                      Text('Resources:', textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
                      SizedBox(height: 30),
                      Text('Milk: 250', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                      Text('Water: 250', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                      Text('Beans: 250', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      Text('Cash: 0', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.grey)),
                    ],
                    ),
                ),
                ],
                ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Column(
                    children: [
                      TextFormField(readOnly: true,
                      initialValue: 'Put milk', style: TextStyle(color: Colors.grey, fontSize: 14),
                      validator: (value){
                      if(value!.isEmpty) return 'Put milk';
                    }),
                    SizedBox(height: 5),
                    TextFormField(readOnly: true,
                      initialValue: 'Put water', style: TextStyle(color: Colors.grey, fontSize: 14),
                      validator: (value){
                      if(value!.isEmpty) return 'Put water';
                    }),
                    SizedBox(height: 5),
                    TextFormField(readOnly: true,
                      initialValue: 'Put beans', style: TextStyle(color: Colors.grey, fontSize: 14),
                      validator: (value){
                      if(value!.isEmpty) return 'Put beans';
                    }),
                    SizedBox(height: 5),
                    TextFormField(readOnly: true,
                      initialValue: 'Put cash', style: TextStyle(color: Colors.grey, fontSize: 14),
                      validator: (value){
                      if(value!.isEmpty) return 'Put cash';
                    }),
                    SizedBox(height: 5),
                    ButtonBar(
              mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.green), ),
                    child: Text('+', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),

                  ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),),
                    child: Text('-', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ],
            ),
                    ],
                  ),
                ),
              ],
              ),
            ),
          ]
        )
      )
    );
  }
}
