import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home/components/gym_card.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/stop_watch_timer.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User user = FirebaseAuth.instance.currentUser!;

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
          text: "Hola ${user.displayName!}",
          colorText: Colors.white,
          automaticallyImplyLeading: false,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.05,
          ),
        ),
        body: FutureBuilder<String>(
          future: getExpirateDate(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return shimmerLoadingEffect();
            } else {
              return SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.0223),
                  Stack(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.104,
                      ),
                      child: Container(
                        height: SizeConfig.screenHeight * 0.20,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 52, 72, 100),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Positioned(
                      left: SizeConfig.screenWidth * 0.194,
                      top: SizeConfig.screenHeight * 0.017,
                      child: SizedBox(
                        height: SizeConfig.screenHeight * 0.026,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.025,
                          ),
                          decoration: BoxDecoration(
                              color: const Color(0xffca0000),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.white,
                              )),
                          child: Center(
                            child: Text(
                              "Vencimiento: ${snapshot.data!}",
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
                          image:
                              const AssetImage("assets/image/Fondo_Login.jpg"),
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
                          image:
                              const AssetImage("assets/image/Fondo_Login.jpg"),
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
                      name: 'Métodos de pago',
                      onTap: () {
                        Navigator.pushNamed(context, '/paymentMethods');
                      },
                      image: const AssetImage("assets/image/Fondo_Sing_In.jpg"),
                      height: SizeConfig.screenHeight * 0.164,
                      padding: EdgeInsets.only(
                        top: SizeConfig.screenHeight * 0.075,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.0223),
                ]),
              );
            }
          },
        ),
      ),
    );
  }

  Widget shimmerLoadingEffect() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.104,
            ),
            child: Column(
              children: [
                shimmerContainer(
                  height: SizeConfig.screenHeight * 0.20,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.0223),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shimmerContainer(
                      height: SizeConfig.screenHeight * 0.164,
                      width: SizeConfig.screenWidth * 0.356,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.0223),
                    shimmerContainer(
                      height: SizeConfig.screenHeight * 0.164,
                      width: SizeConfig.screenWidth * 0.356,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.0223),
                shimmerContainer(
                  height: SizeConfig.screenHeight * 0.164,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget shimmerContainer({required double height, double? width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.grey.withOpacity(0.5),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
