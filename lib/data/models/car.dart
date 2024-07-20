class Car {
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Car({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
  });

  factory Car.fromDocument(Map<String, dynamic> data) {
    return Car(
      model: data['model'],
      distance: data['distance'],
      fuelCapacity: data['fuelCapacity'],
      pricePerHour: data['pricePerHour'],
    );
  }
}
