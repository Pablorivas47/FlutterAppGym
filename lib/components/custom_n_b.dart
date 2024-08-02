import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/routes.dart';
import 'package:flutter_application_1/constants/size_config.dart';


class CustomNB extends StatefulWidget {
   const CustomNB({
    super.key, 

    });
  @override
  State<CustomNB> createState() => _CustomNB();
}

class _CustomNB extends State<CustomNB> {
  int selectedIndex = 0;

  List<Widget> widgetOptions = <Widget>[
      const Home(),
      const Routine(),
      const Profile(),
    ];

  @override
  Widget build(BuildContext context) {
    return  Container(

      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
          )
      ),
      
      child: Theme(
        data: Theme.of(context).copyWith(
        splashColor: Colors.transparent, // Color de splash al hacer tap transparente
        highlightColor: Colors.transparent, // Color de highlight al hacer tap transparente
        ),
        
        child: Scaffold(
         
          backgroundColor: Colors.transparent,
          
          body: Center(
            child: widgetOptions[selectedIndex],
          ),
        
          bottomNavigationBar: NavigationBar(
            indicatorColor: const Color.fromARGB(255, 238, 199, 199),
            backgroundColor: Colors.transparent,

            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            
            

            
            // indicatorShape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(10),
            // ),


            onDestinationSelected: (int index){
              setState(() {
                selectedIndex = index;
              });
            },
            selectedIndex: selectedIndex, 
            destinations: <Widget> [
              NavigationDestination(
                  label: "Menu", 
                  icon: Icon(
                    CupertinoIcons.house_fill,
                    size: SizeConfig.screenHeight*0.03,
                    color: Colors.white,
                  )
                ),
          
                NavigationDestination(
                  label: "Rutina",
                  icon: Icon(
                    CupertinoIcons.doc_text_fill,
                    size: SizeConfig.screenHeight*0.03,
                    color: Colors.white,
                  )
                ),
          
                NavigationDestination(
                  label: "Perfil",
                  icon: Icon(
                    CupertinoIcons.person_circle_fill,
                    size: SizeConfig.screenHeight*0.03,
                    color: Colors.white,
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}