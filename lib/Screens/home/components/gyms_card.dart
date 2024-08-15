import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home/components/gym_card.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:shimmer/shimmer.dart';

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
            return const GriedViewShimmer();
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
              crossAxisSpacing:
              SizeConfig.screenWidth * 0.078, // Espacio horizontal
              mainAxisSpacing: SizeConfig.screenHeight * 0.049, // Espacio vertical 
              ),
              itemCount: gyms?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
              var gymData = gyms?[index];
              String name = gymData['name'] ?? 'Unnamed Gym'; // Manejo de nulos
              return GymCard(
                name: name,
                onTap: () {},
                image: const AssetImage("assets/image/Fondo_Sing_In.jpg"),
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

class GriedViewShimmer extends StatelessWidget {
  const GriedViewShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(
        left: SizeConfig.screenWidth * 0.104,
        right: SizeConfig.screenWidth * 0.104,
        top: SizeConfig.screenHeight * 0.09,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Número de columnas
        crossAxisSpacing: SizeConfig.screenWidth *
            0.078, // Espacio horizontal entre tarjetas
        mainAxisSpacing: SizeConfig.screenHeight *
            0.049, // Espacio vertical entre tarjetas
      ),
      itemCount: 4, // Número de tarjetas de shimmer
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.2),
          highlightColor: Colors.grey.withOpacity(0.5),
          child: Container(
            width: SizeConfig.screenWidth * 0.356,
            height: SizeConfig.screenHeight * 0.164,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius:
                  BorderRadius.circular(SizeConfig.screenWidth * 0.05),
            ),
          ),
        );
      },
    );
  }
}
