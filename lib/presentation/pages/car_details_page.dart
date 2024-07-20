import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/presentation/pages/maps_details_page.dart';
import 'package:car_rental_app/presentation/widgets/car_card.dart';
import 'package:car_rental_app/presentation/widgets/more_card.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatefulWidget {
  final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = Tween<double>(begin: 1, end: 1.4).animate(controller!)
      ..addListener(() {
        setState(() {});
      });
    controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller!.forward();
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text(
              'Information',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(car: widget.car),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
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
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.jpg'),
                        ),
                        SizedBox(height: 10),
                        Text('John Doe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('\$4,253', style: TextStyle(fontSize: 16, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MapsDetailsPage(car: widget.car)));
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset('assets/map.jpg', fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                    car: Car(
                        model: '${widget.car.model}-1',
                        distance: widget.car.distance + 100,
                        fuelCapacity: widget.car.fuelCapacity + 100,
                        pricePerHour: widget.car.pricePerHour + 10)),
                const SizedBox(height: 5),
                MoreCard(
                    car: Car(
                        model: '${widget.car.model}-2',
                        distance: widget.car.distance + 200,
                        fuelCapacity: widget.car.fuelCapacity + 200,
                        pricePerHour: widget.car.pricePerHour + 20)),
                const SizedBox(height: 5),
                MoreCard(
                    car: Car(
                        model: '${widget.car.model}-3',
                        distance: widget.car.distance + 300,
                        fuelCapacity: widget.car.fuelCapacity + 300,
                        pricePerHour: widget.car.pricePerHour + 30)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
