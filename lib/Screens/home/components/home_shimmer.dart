import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

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
          text: "Hola",
          colorText: Colors.white,
          automaticallyImplyLeading: false,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.05,
          ),
        ),
        body: Column(children: [
          SizedBox(height: SizeConfig.screenHeight * 0.0223),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.104,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shimmerContainer(
                  width: SizeConfig.screenWidth * 0.356,
                  height: SizeConfig.screenHeight * 0.164,
                ),
                shimmerContainer(
                  width: SizeConfig.screenWidth * 0.356,
                  height: SizeConfig.screenHeight * 0.164,
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.0223),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.104,
            ),
            child: shimmerContainer(
              width: SizeConfig.screenWidth * 0.791,
              height: SizeConfig.screenHeight * 0.164,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.0223),
        ]),
      ),
    );
  }

  Widget shimmerContainer({required double height, required double width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
