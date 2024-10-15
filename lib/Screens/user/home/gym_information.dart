import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/user/home/components/activity_card.dart';
import 'package:flutter_application_1/Screens/user/home/components/animated_containter_expanded.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:flutter_application_1/objetos/gym.dart';

class InformationGym extends StatefulWidget {
  final Gym? gym;
  const InformationGym({super.key, required this.gym});

  @override
  State<InformationGym> createState() => _InformationGymState();
}

class _InformationGymState extends State<InformationGym> {
  int _expandedIndex = -1;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Fondo transparente del Scaffold
      body: Stack(
        children: [
          //Fondo degradado
          Container(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 88, 159),
                  Color.fromARGB(255, 125, 0, 147),
                ],
              ),
            ),
          ),
          // Contenido scrollable con SliverAppBar
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: true,
                stretch: true,
                forceElevated: true,
                expandedHeight: SizeConfig.screenHeight * 0.4,
                pinned: true,
                elevation: 10,
                scrolledUnderElevation: 10,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: widget.gym!.images.length,
                        onPageChanged: (index) {},
                        itemBuilder: (context, index) {
                          return Image.network(
                            widget.gym!.images[index],
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProcess) {
                              if (loadingProcess == null) {
                                return child;
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(SizeConfig.screenHeight * 0.1),
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight * 0.1,
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 0, 88, 159),
                          Color.fromARGB(255, 125, 0, 147),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.104,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.gym!.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Inter",
                            fontSize: SizeConfig.screenWidth * 0.075,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.104),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.gym!.description,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Inter",
                            fontSize: SizeConfig.screenHeight * 0.0215,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.015,
                      ),
                      Container(
                        height: SizeConfig.screenHeight * 0.002,
                        width: SizeConfig.screenWidth * 0.8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gral. Rodriguez 1964",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Inter",
                              fontSize: SizeConfig.screenHeight * 0.0215,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/location');
                            },
                            child: Container(
                              height: SizeConfig.screenHeight * 0.05,
                              width: SizeConfig.screenHeight * 0.05,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.location_solid,
                                  color: Colors
                                      .red, // Cambia el color según sea necesario
                                  size: SizeConfig.screenWidth * 0.075,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.015,
                      ),
                      Container(
                        height: SizeConfig.screenHeight * 0.002,
                        width: SizeConfig.screenWidth * 0.8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.0223,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight *
                            0.15, // Altura del GridView
                        child: GridView.builder(
                          scrollDirection:
                              Axis.horizontal, // Desplazamiento horizontal
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, // Una sola fila
                            childAspectRatio:
                                1.5, // Relación de aspecto 1:1 para las tarjetas
                            mainAxisSpacing: SizeConfig.screenWidth *
                                0.075, // Espacio horizontal entre las tarjetas
                          ),
                          itemCount: widget.gym?.activities.length,
                          itemBuilder: (context, index) {
                            return ActivityCard(
                              onTap: () {
                                setState(() {
                                  _expandedIndex =
                                      (_expandedIndex == index) ? -1 : index;
                                });
                              },
                              name: widget.gym?.activities[index].name ?? '',
                              isSelected: _expandedIndex == index,
                            );
                          },
                        ),
                      ),
                      if (_expandedIndex != -1)
                        AnimatedContainerExpanded(
                          expandedIndex: _expandedIndex,
                          activity: widget.gym!.activities[_expandedIndex],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
