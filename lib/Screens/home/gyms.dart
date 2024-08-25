import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home/components/gym_card.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/components/filter_button.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:shimmer/shimmer.dart';

class Gyms extends StatefulWidget {
  const Gyms({super.key});

  @override
  State<Gyms> createState() => _GymsState();
}

class _GymsState extends State<Gyms> {
  TextEditingController filterController = TextEditingController();

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
        appBar: const CustomAppBar(
          text: 'Gimnasios',
          colorText: Colors.white,
          automaticallyImplyLeading: true,
          padding: EdgeInsets.zero,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.0223),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.104,
                    ),
                    child: personalizeTextFormField(
                      filterController,
                      filled: true,
                      fillColor: Colors.white,
                      colorHintText: Colors.black,
                      colorIcon: Colors.black,
                      hintText: "Buscar",
                      icon: Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                        size: SizeConfig.screenHeight * 0.03,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.0223),
                  const FilterButton(),
                  SizedBox(height: SizeConfig.screenHeight * 0.0223),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: FutureBuilder(
                future: getGYM(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const GriedViewShimmer();
                  } else {
                    var gyms = snapshot.data;
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.104,
                      ),
                      child: GridView.builder(
                        //physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Número de columnas
                          crossAxisSpacing: SizeConfig.screenWidth *
                              0.078, // Espacio horizontal
                          mainAxisSpacing: SizeConfig.screenHeight *
                              0.03, // Espacio vertical
                        ),
                        itemCount: gyms?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          var gymData = gyms?[index];
                          String name = gymData['name'] ??
                              'Unnamed Gym'; // Manejo de nulos
                          String imageUrl = gymData['image'];
                          return GymCard(
                            alignmentImage: Alignment.center,
                            name: name,
                            onTap: () {},
                            image: NetworkImage(imageUrl),
                            paddingText: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.075,
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
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
        crossAxisSpacing:
            SizeConfig.screenWidth * 0.078, // Espacio horizontal entre tarjetas
        mainAxisSpacing:
            SizeConfig.screenHeight * 0.049, // Espacio vertical entre tarjetas
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
