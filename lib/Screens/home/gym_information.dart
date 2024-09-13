import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home/components/activity_card.dart';
import 'package:flutter_application_1/Screens/home/components/animated_containter_expanded.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:flutter_application_1/objetos/gym.dart';
import 'package:provider/provider.dart';

class InformationGym extends StatefulWidget {
  final Gym? gym;
  const InformationGym({super.key, required this.gym});

  @override
  State<InformationGym> createState() => _InformationGymState();
}

class _InformationGymState extends State<InformationGym> {
  int _expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context
          .watch<ProviderService>()
          .providerGetGymDataPointActivity(widget.gym!.uid),
      builder: (context, snapshot) {
        if (context.watch<ProviderService>().gymDataActivity == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            backgroundColor:
                Colors.transparent, // Fondo transparente del Scaffold
            body: Stack(
              children: [
                // Fondo degradado
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 0, 113, 206),
                        Color.fromARGB(255, 169, 0, 199),
                      ],
                    ),
                  ),
                ),
                // Contenido scrollable con SliverAppBar
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      elevation: 0,
                      backgroundColor: Colors
                          .transparent, // Transparente para que se vea el degradado
                      scrolledUnderElevation: 0,
                      expandedHeight: SizeConfig.screenHeight * 0.325,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(30),
                          ),
                          child: Image.network(
                            widget.gym!.images[1],
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProcess) {
                              if (loadingProcess == null) {
                                return child;
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize:
                            Size.fromHeight(SizeConfig.screenHeight * 0.05),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                          child: Container(
                            height: SizeConfig.screenHeight * 0.08,
                            alignment: Alignment.bottomLeft,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 0, 113, 206),
                                  Color.fromARGB(255, 169, 0, 199),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.screenWidth * 0.104,
                              ),
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.03,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.104,
                            ),
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
                              itemCount: context
                                  .read<ProviderService>()
                                  .gymDataActivity
                                  ?.length,
                              itemBuilder: (context, index) {
                                return ActivityCard(
                                  onTap: () {
                                    setState(() {
                                      _expandedIndex = (_expandedIndex == index)
                                          ? -1
                                          : index;
                                    });
                                  },
                                  name: context
                                      .read<ProviderService>()
                                      .gymDataActivity?[index]
                                      .name,
                                  isSelected: _expandedIndex == index,
                                );
                              },
                            ),
                          ),
                          if (_expandedIndex != -1)
                            AnimatedContainerExpanded(
                              expandedIndex: _expandedIndex,
                              activity: context
                                  .watch<ProviderService>()
                                  .gymDataActivity?[_expandedIndex],
                            ),
                          Container(
                            height: 200,
                            width: 290,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
