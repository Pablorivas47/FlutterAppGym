import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<ProviderService>().providerGetAdminAndGymData(),
        builder: (context, snapshot) {
          if (context.read<ProviderService>().adminGymData == null) {
            return shimmerLoadingEffect();
          } else {
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
                  text: context
                          .read<ProviderService>()
                          .adminGymData?['gym']
                          .name ??
                      '',
                  colorText: Colors.white,
                  automaticallyImplyLeading: false,
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.05,
                  ),
                ),
                body: Column(children: [
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
                  ]),
                ]),
              ),
            );
          }
        });
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
        appBar: CustomAppBar(
          text: "Hola",
          colorText: Colors.white,
          automaticallyImplyLeading: false,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.05,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.104,
          ),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.0223),
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
