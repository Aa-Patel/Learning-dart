// Making a zoo inventory and feeding simulation

void main() {
  Lion simba = Lion("Simba", 5, true);
  Lion sara = Lion("Sara", 5, false);
  Elephant bheema = Elephant("Bheema", 12, true);
  Monkey laddu = Monkey("Laddu", 2, false);

  Zookeeper keeper = Zookeeper();

  List<Animal> animals = [simba, sara, bheema, laddu];

  keeper.status_report(animals);
  keeper.feed(sara);
  keeper.feed(bheema);
  keeper.status_report(animals);
}

abstract class Animal {
  String name;
  int age;
  bool fed;
  Animal({required this.name, required this.age, required this.fed}) {}

  @override
  String toString() => "Name: $name ,Age: $age, Fed: $fed";
}

class Lion extends Animal {
  Lion(String name, int age, bool fed) : super(name: name, age: age, fed: fed);
}

class Elephant extends Animal {
  Elephant(String name, int age, bool fed)
    : super(name: name, age: age, fed: fed);
}

class Monkey extends Animal {
  Monkey(String name, int age, bool fed)
    : super(name: name, age: age, fed: fed);
}

class Zookeeper {
  void feed(Animal animal) {
    if (animal.fed == false) {
      animal.fed = true;
      print("Fed ${animal.name}.");
    } else {
      print("${animal.name} has already been fed.");
    }
  }

  void status_report(List<Animal> animals) {
    print(animals);
  }
}
