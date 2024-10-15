import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class Routine extends StatefulWidget {
  const Routine({super.key});

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
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
                flexibleSpace: const FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      // PageView.builder(
                      //   controller: _pageController,
                      //   itemCount: widget.gym!.images.length,
                      //   onPageChanged: (index) {},
                      //   itemBuilder: (context, index) {
                      //     return Image.network(
                      //       widget.gym!.images[index],
                      //       fit: BoxFit.cover,
                      //       loadingBuilder: (context, child, loadingProcess) {
                      //         if (loadingProcess == null) {
                      //           return child;
                      //         } else {
                      //           return const Center(
                      //               child: CircularProgressIndicator());
                      //         }
                      //       },
                      //     );
                      //   },
                      // ),
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
                        alignment: Alignment.center,
                        child: Text(
                          "Entreno",
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
