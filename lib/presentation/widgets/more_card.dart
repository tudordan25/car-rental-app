import 'package:car_rental_app/data/models/car.dart';
import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  final Car car;

  const MoreCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xff212020),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(car.model, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 2),
                  Text(' ${car.distance} km', style: const TextStyle(color: Colors.white, fontSize: 14)),
                  const SizedBox(width: 10),
                  const Icon(Icons.battery_full, color: Colors.white, size: 16),
                  const SizedBox(width: 2),
                  Text(car.fuelCapacity.toString(), style: const TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ],
          ),
          IconButton(
            alignment: Alignment.centerRight,
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('More details about ${car.model}', style: const TextStyle(color: Colors.black)),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.blue[100],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
