enum CoffeeType {
  Espresso,
  Americano,
  Latte,
  Cappuccino,
}

class Resources {
  String coffee;
  int water;
  int milk;
  int coffeeBeans;

  Resources({this.coffee = 'black coffee', this.water = 0, this.milk = 0, this.coffeeBeans = 0});

  void addCoffee(String newCoffee) {
    coffee = newCoffee;
  }

  void addWater(int additionalWater) {
    water += additionalWater;
  }

  void addMilk(int additionalMilk) {
    milk += additionalMilk;
  }

  void addCoffeeBeans(int additionalCoffeeBeans) {
    coffeeBeans += additionalCoffeeBeans;
  }

  bool checkResources(int waterNeeded, int coffeeBeansNeeded) {
    return water >= waterNeeded && coffeeBeans >= coffeeBeansNeeded;
  }
}

abstract class ICoffee {
  String getName();
  int getWaterNeeded();
  int getCoffeeBeansNeeded();
}

class Espresso implements ICoffee {
  @override
  String getName() => 'Espresso';

  @override
  int getWaterNeeded() => 30;

  @override
  int getCoffeeBeansNeeded() => 20;
}

class Americano implements ICoffee {
  @override
  String getName() => 'Americano';

  @override
  int getWaterNeeded() => 100;

  @override
  int getCoffeeBeansNeeded() => 20;
}

class Latte implements ICoffee {
  @override
  String getName() => 'Latte';

  @override
  int getWaterNeeded() => 200;

  @override
  int getCoffeeBeansNeeded() => 30;
}

class Cappuccino implements ICoffee {
  @override
  String getName() => 'Cappuccino';

  @override
  int getWaterNeeded() => 150;

  @override
  int getCoffeeBeansNeeded() => 25;
}

/*class CoffeeMachine {
  final Resources _resources;

  CoffeeMachine({Resources resources}) {
    _resources = resources ?? Resources();
  }

  void makeCoffee(ICoffee coffee) {
    if (_resources.checkResources(coffee.getWaterNeeded(), coffee.getCoffeeBeansNeeded())) {
      _resources.addCoffee(coffee.getName());
      _resources.addWater(-coffee.getWaterNeeded());
      _resources.addCoffeeBeans(-coffee.getCoffeeBeansNeeded());
      print('Your ${coffee.getName()} is ready!');
    } else {
      print('Not enough resources to make ${coffee.getName()}');
    }
  }
}

void main() {
  var resources = Resources(water: 1000, milk: 500,);
      var coffeeMachine = CoffeeMachine(resources: resources);
  coffeeMachine.makeCoffee(Espresso());
  coffeeMachine.makeCoffee(Americano());
  coffeeMachine.makeCoffee(Latte());
  coffeeMachine.makeCoffee(Cappuccino());
}*/