// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class InformationGym extends StatefulWidget {
  final String name;
  final List<dynamic> imagesUrl;
  final String descripcion;
  const InformationGym(
      {super.key,
      required this.name,
      required this.imagesUrl,
      required this.descripcion});

  @override
  State<InformationGym> createState() => _InformationGymState();
}

class _InformationGymState extends State<InformationGym> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 0, 92, 149),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Color.fromARGB(255, 0, 92, 149),
                  elevation: 0,
                  scrolledUnderElevation: 0, // 100% blanco
                  expandedHeight: SizeConfig.screenHeight * 0.315,
                  pinned: true,
                  bottom: PreferredSize(
                    preferredSize:
                        Size.fromRadius(SizeConfig.screenHeight * 0.02),
                    child: Container(
                      height: SizeConfig.screenHeight * 0.05,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          // image: DecorationImage(
                          //   fit: BoxFit.cover,
                          //   image:
                          //       AssetImage("assets/image/Fondo_Sing_In.jpg"),
                          // ),
                          color: Color.fromARGB(255, 0, 92, 149),
                          border: Border.fromBorderSide(
                              BorderSide.none), // aparece una linea sino
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          )),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'assets/image/Rutina.jpg', // Ruta de la imagen en assets
                      fit: BoxFit
                          .cover, // Ajusta la imagen para cubrir el espacio disponible
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: SizeConfig.screenWidth * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
