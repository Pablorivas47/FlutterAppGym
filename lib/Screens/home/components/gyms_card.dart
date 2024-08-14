import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home/components/gym_card.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class GymsCard extends StatefulWidget {
  const GymsCard({super.key});

  @override
  State<GymsCard> createState() => _GymsCardState();
}

class _GymsCardState extends State<GymsCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
        future: getGYM(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var gyms = snapshot.data;
            return GridView.builder(
              padding: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.104,
                right: SizeConfig.screenWidth * 0.104,
                top: SizeConfig.screenHeight * 0.09,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Número de columnas
                crossAxisSpacing: SizeConfig.screenWidth *
                    0.078, // Espacio horizontal entre tarj5etas
                mainAxisSpacing: SizeConfig.screenHeight *
                    0.049, // Espacio vertical entre tarjetas
              ),
              itemCount: gyms?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var gymData = gyms?[index];
                String name =
                    gymData['name'] ?? 'Unnamed Gym'; // Manejo de nulos
                return GymCard(
                  name: name,
                  onTap: () {},
                  image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
                  padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight * 0.075,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
