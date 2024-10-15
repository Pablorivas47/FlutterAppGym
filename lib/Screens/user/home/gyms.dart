import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/user/home/components/home_card.dart';
import 'package:flutter_application_1/Screens/user/home/gym_information.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/components/filter_button.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:flutter_application_1/objetos/gym.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Gyms extends StatefulWidget {
  const Gyms({super.key});

  @override
  State<Gyms> createState() => _GymsState();
}

class _GymsState extends State<Gyms> {
  TextEditingController filterController = TextEditingController();
  String? selectedActivity; // Variable para la actividad seleccionada
  String selectedFilter = 'Todos'; // Variable para el filtro seleccionado

  @override
  void initState() {
    super.initState();

    // Escuchar cambios en el TextEditingController
    filterController.addListener(() {
      // Filtrar gimnasios cada vez que cambie el texto
      context.read<ProviderService>().providerGetFilteredGyms(
            filterController.text,
            selectedActivity,
          );
    });
  }

  void onActivitySelected(String activity) {
    setState(() {
      selectedActivity = activity;
      // Llama al método para filtrar gimnasios por actividad
      context.read<ProviderService>().providerGetFilteredGyms(
            filterController.text,
            selectedActivity,
          );
    });
  }

  void onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
      // Llama al método para filtrar gimnasios según el filtro seleccionado
      context.read<ProviderService>().providerGetFilteredGyms(
            filterController.text,
            selectedFilter == 'Todos' ? null : selectedActivity,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ProviderService>().providerGetGymsAndActivities(),
      builder: (context, snapshot) {
        // Verifica si los gimnasios están disponibles
        if (context.read<ProviderService>().gymsAndActivities == null) {
          return griedViewShimmer();
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
                        FilterButton(
                          onFilterSelected: onFilterSelected,
                          onActivitySelected: onActivitySelected,
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.0223),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.104,
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Número de columnas
                          crossAxisSpacing: SizeConfig.screenWidth *
                              0.125, // Espacio horizontal
                          mainAxisSpacing: SizeConfig.screenHeight *
                              0.02, // Espacio vertical
                          mainAxisExtent: SizeConfig.screenHeight * 0.2,
                        ),
                        itemCount: context
                            .watch<ProviderService>()
                            .filteredGym
                            .length, // Usa la lista filtrada
                        itemBuilder: (BuildContext context, int index) {
                          Gym gym = context
                              .watch<ProviderService>()
                              .filteredGym[index]; // Accede a la lista filtrada
                          return HomeCard(
                            alignmentImage: Alignment.topCenter,
                            heightFactor: 0.75,
                            paddingText: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.17,
                            ),
                            name: gym.name,
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return InformationGym(
                                    gym: gym,
                                  );
                                }),
                              );
                            },
                            image: NetworkImage(gym.logo),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

Widget griedViewShimmer() {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
    )),
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.104,
              ),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.0223),
                  shimmerContainer(
                    height: SizeConfig.screenHeight * 0.08,
                    sizeBorderRadius: 10,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.0223),
                  Row(
                    children: [
                      shimmerContainer(
                        height: SizeConfig.screenHeight * 0.025,
                        width: SizeConfig.screenWidth * 0.175,
                        sizeBorderRadius: 5,
                      ),
                      SizedBox(width: SizeConfig.screenWidth * 0.0223),
                      shimmerContainer(
                        height: SizeConfig.screenHeight * 0.025,
                        width: SizeConfig.screenWidth * 0.175,
                        sizeBorderRadius: 5,
                      ),
                      SizedBox(width: SizeConfig.screenWidth * 0.0223),
                      shimmerContainer(
                        height: SizeConfig.screenHeight * 0.025,
                        width: SizeConfig.screenWidth * 0.175,
                        sizeBorderRadius: 5,
                      ),
                      SizedBox(width: SizeConfig.screenWidth * 0.0223),
                      shimmerContainer(
                        height: SizeConfig.screenHeight * 0.025,
                        width: SizeConfig.screenWidth * 0.175,
                        sizeBorderRadius: 5,
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.0223),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.104,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: SizeConfig.screenWidth * 0.1,
                  mainAxisSpacing: SizeConfig.screenHeight * 0.04,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return shimmerContainer(sizeBorderRadius: 20);
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget shimmerContainer(
    {double? height, double? width, required double sizeBorderRadius}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(0.2),
    highlightColor: Colors.grey.withOpacity(0.5),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(sizeBorderRadius),
      ),
    ),
  );
}
