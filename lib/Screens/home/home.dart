import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home/components/home_card.dart';
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
              return Column(children: [
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
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.104,
                      ),
                      height: SizeConfig.screenHeight * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HomeCard(
                            name: 'Gimnasios',
                            onTap: () {
                              Navigator.pushNamed(context, '/gyms');
                            },
                            image:
                                const AssetImage("assets/image/Gimnasios.jpg"),
                            heightFactor: 0.65,
                            alignmentImage: Alignment.topCenter,
                            width: SizeConfig.screenWidth * 0.356,
                            height: SizeConfig.screenHeight * 0.2,
                            paddingText: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.15,
                            ),
                          ),
                          HomeCard(
                            name: 'Turnos',
                            onTap: () {
                              //Navigator.pushNamed(context, '/googleMaps');
                            },
                            image: const AssetImage("assets/image/Rutina.jpg"),
                            heightFactor: 0.75,
                            alignmentImage: Alignment.topCenter,
                            width: SizeConfig.screenWidth * 0.356,
                            height: SizeConfig.screenHeight * 0.2725,
                            paddingText: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.225,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: SizeConfig.screenWidth * 0.104,
                      right: SizeConfig.screenWidth * 0.104,
                      top: SizeConfig.screenHeight * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          HomeCard(
                            name: 'Pagos',
                            onTap: () {
                              //Navigator.pushNamed(context, '/googleMaps');
                            },
                            image: const AssetImage("assets/image/Pago.png"),
                            heightFactor: 0.75,
                            alignmentImage: Alignment.topCenter,
                            width: SizeConfig.screenWidth * 0.356,
                            height: SizeConfig.screenHeight * 0.2725,
                            paddingText: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.225,
                            ),
                          ),
                          HomeCard(
                            name: 'Armar Rutina',
                            onTap: () {
                              //Navigator.pushNamed(context, '/gyms');
                            },
                            image: const AssetImage("assets/image/Boy.jpg"),
                            heightFactor: 0.65,
                            alignmentImage: Alignment.topCenter,
                            width: SizeConfig.screenWidth * 0.356,
                            height: SizeConfig.screenHeight * 0.2,
                            paddingText: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]);
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
