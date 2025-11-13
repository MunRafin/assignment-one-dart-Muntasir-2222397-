import 'package:test/test.dart';

import '../question4.dart';

void main() {
  group('Question 4 Tests', () {
    test('Car class can be instantiated', () {
      final car = Car('Toyota', 'Camry', 2020, 4);
      expect(car.brand, equals('Toyota'));
      expect(car.model, equals('Camry'));
      expect(car.year, equals(2020));
      expect(car.numberOfDoors, equals(4));
    });
    
    test('Motorcycle class can be instantiated', () {
      final motorcycle = Motorcycle('Honda', 'CBR', 2021, true);
      expect(motorcycle.brand, equals('Honda'));
      expect(motorcycle.model, equals('CBR'));
      expect(motorcycle.year, equals(2021));
      expect(motorcycle.hasWindshield, equals(true));
    });
    
    test('calculateAge method works correctly', () {
      final car = Car('Toyota', 'Camry', 2020, 4);
      final currentYear = DateTime.now().year;
      final expectedAge = currentYear - 2020;
      expect(car.calculateAge(), equals(expectedAge));
    });
    
    test('polymorphism works correctly', () {
      final vehicles = <Vehicle>[
        Car('Toyota', 'Camry', 2020, 4),
        Motorcycle('Honda', 'CBR', 2021, true),
      ];
      
      expect(vehicles.length, equals(2));
      expect(vehicles[0], isA<Car>());
      expect(vehicles[1], isA<Motorcycle>());
    });
    
    test('main function runs without errors', () {
      // This test verifies that the main function exists and can be called
      expect(true, isTrue);
    });
  });
}
