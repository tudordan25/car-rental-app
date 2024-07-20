import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/presentation/pages/car_details_page.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ModalRoute.of(context)!.settings.name == '/carListPage') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CarDetailsPage(car: car),
              settings: const RouteSettings(name: '/carDetailsPage'),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/car.png',
              height: 160,
            ),
            Text(
              car.model,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/gps.png', width: 15),
                        Text(' ${car.distance.toStringAsFixed(0)} km '),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('assets/fuel.png', width: 15),
                        Text(' ${car.fuelCapacity.toStringAsFixed(0)} L'),
                      ],
                    ),
                  ],
                ),
                Text(
                  '\$${car.pricePerHour.toStringAsFixed(0)}/hour',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
