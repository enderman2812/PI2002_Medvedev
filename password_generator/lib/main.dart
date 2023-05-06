import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Random Password Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Генератор случайного пароля',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                readOnly: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffix: IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      final data = ClipboardData(text: controller.text);
                      Clipboard.setData(data);

                      final snackBar = SnackBar(
                        content: const Text(
                          'Пароль скопирован в буфер обмена',
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.greenAccent,
                      );
                      ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(snackBar);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildButton() {
    final backgroundColor = MaterialStateColor.resolveWith((states) => states.contains(MaterialState.pressed) ? Colors.grey : Colors.greenAccent);
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: backgroundColor),
      child: const Text('Сгенерировать пароль', style: TextStyle(color: Colors.white)),
      onPressed: () {
        final password = generatePassword();
        controller.text = password;
      },
    );
  }

  String generatePassword({
    bool beletters = true,
    bool benumbers = true,
    bool bespecial = true,
  }) {
    final leight = 20;
    final lettersLowcase = 'abcdefghijklmnopqrstuvwxyz';
    final lettersUppcase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final numbers = '0123456789';
    final specials = '@#=+-*!\$%&?(){}[]';

     String chars = '';
    if (beletters) chars += '$lettersLowcase$lettersUppcase';
    if (benumbers) chars += '$numbers';
    if (bespecial) chars += '$specials';

    return List.generate(leight, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);

      return chars[indexRandom];
    }).join('');
  }
}