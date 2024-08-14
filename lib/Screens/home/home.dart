import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home/components/gym_card.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.104,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GymCard(
                  name: 'Gimnasios',
                  onTap: () {
                    Navigator.pushNamed(context, '/gyms');
                  },
                  image: const AssetImage("assets/image/Fondo_Login.jpg"),
                  width: SizeConfig.screenWidth * 0.356,
                  height: SizeConfig.screenHeight * 0.164,
                  padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight * 0.075,
                  ),
                ),
                GymCard(
                  name: 'Turnos',
                  onTap: () {
                    Navigator.pushNamed(context, '/gyms');
                  },
                  image: const AssetImage("assets/image/Fondo_Login.jpg"),
                  width: SizeConfig.screenWidth * 0.356,
                  height: SizeConfig.screenHeight * 0.164,
                  padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight * 0.075,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.0223),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.104,
            ),
            child: GymCard(
              name: 'Metodos de pago',
              onTap: () {},
              image: const AssetImage("assets/image/Fondo_Sing_In.jpg"),
              width: SizeConfig.screenWidth * 0.791,
              height: SizeConfig.screenHeight * 0.164,
              padding: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.075,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.0223),
        ]),
      ),
    );
  }
}
