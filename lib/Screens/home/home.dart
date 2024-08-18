import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home/components/gym_card.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/components/stop_watch_timer.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User userS = FirebaseAuth.instance.currentUser!;

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
        appBar: CustomAppBar(
          text: "Hola ${userS.displayName!}",
          colorText: Colors.white,
          automaticallyImplyLeading: false,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.05,
          ),
        ),
        body: Column(children: [
          Stack(children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.104,
              ),
              child: AnimatedContainer(
                height: SizeConfig.screenHeight * 0.20,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 52, 72, 100),
                    borderRadius: BorderRadius.circular(
                      SizeConfig.screenWidth * 0.05,
                    ),
                    border: Border.all(
                      color: Colors.white,
                    )),
                duration: Duration.zero,
              ),
            ),
            Positioned(
              left: SizeConfig.screenWidth * 0.194,
              top: SizeConfig.screenHeight * 0.017,
              child: SizedBox(
                height: SizeConfig.screenHeight * 0.026,
                child: AnimatedContainer(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.025,
                  ),
                  duration: Duration.zero,
                  decoration: BoxDecoration(
                      color: const Color(0xffca0000),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.white,
                      )),
                  child: Center(
                    child: Text(
                      "Vencimiento: 31/01/24",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w300,
                        fontSize: SizeConfig.screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.screenHeight * 0.055,
                ),
                child: const StopWatchTimer()),
          ]),
          SizedBox(height: SizeConfig.screenHeight * 0.0223),
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
                    Navigator.pushNamed(context, '/googleMaps');
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
              onTap: () {
                Navigator.pushNamed(context, '/paymentMethods');
              },
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
