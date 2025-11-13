abstract class Vehicle {
  Vehicle(this.brand, this.model, this.year);
  String brand;
  String model;
  int year;

  // Abstract methods
  void start();
  void stop();

  // Concrete method
  void displayInfo() {
    print('Vehicle Info: $year $brand $model');
  }

  // Add a method to calculate vehicle age (current year - vehicle year)
  int calculateAge() {
    return DateTime.now().year - year;
  }
}

class Car extends Vehicle {
  Car(super.brand, super.model, super.year, this.numberOfDoors);
  int numberOfDoors;

  @override
  void start() {
    print('Starting the car engine...');
  }

  @override
  void stop() {
    print('Stopping the car engine...');
  }

  @override
  void displayInfo() {
    print('Vehicle Info: $year $brand $model ($numberOfDoors doors)');
  }
}

class Motorcycle extends Vehicle {
  Motorcycle(super.brand, super.model, super.year, this.hasWindshield);
  bool hasWindshield;

  @override
  void start() {
    print('Starting the motorcycle engine...');
  }

  @override
  void stop() {
    print('Stopping the motorcycle engine...');
  }

  @override
  void displayInfo() {
    print('Vehicle Info: $year $brand $model (Has windshield: $hasWindshield)');
  }
}

void main() {
  // Create a list of vehicles and demonstrate polymorphism
  final vehicles = <Vehicle>[
    Car('Toyota', 'Camry', 2020, 4),
    Motorcycle('Honda', 'CBR', 2021, true),
    Car('Tesla', 'Model 3', 2023, 4),
    Motorcycle('Harley-Davidson', 'Iron 883', 2019, false),
  ];

  // Demonstrate polymorphism by calling start(), stop(), and displayInfo() on each vehicle
  for (final vehicle in vehicles) {
    vehicle.displayInfo();
    vehicle.start();
    vehicle.stop();
    print('${vehicle.brand} age: ${vehicle.calculateAge()} years');
    print(''); // Add a blank line for readability
  }
}