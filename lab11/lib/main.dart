import 'dart:async';

class CoffeeMachine {
  CoffeeMachine() {
    _heatWater();
  }

  Future<void> _heatWater() async {
    print('Нагрев воды...');
    await Future.delayed(Duration(seconds: 3));
    print('Вода нагрета!');
    _brewCoffee();
  }

  Future<void> _brewCoffee() async {
    print('Завариваю кофе...');
    await Future.delayed(Duration(seconds: 5));
    print('Кофе сварен!');
    _frothMilk();
  }

  Future<void> _frothMilk() async {
    print('Вспенивающееся молоко...');
    await Future.delayed(Duration(seconds: 5));
    print('Вспениватель молока!');
    _mixCoffeeAndMilk();
  }

  Future<void> _mixCoffeeAndMilk() async {
    print('Смешиваем кофе с молоком...');
    await Future.delayed(Duration(seconds: 3));
    print('Смесь кофе и молока!');
    print('Ваш латте готов!');
  }
}

void main() {
  var coffeeMachine = CoffeeMachine();
}