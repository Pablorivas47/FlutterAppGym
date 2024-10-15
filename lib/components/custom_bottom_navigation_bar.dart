import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/user/home/home.dart';
import 'package:flutter_application_1/Screens/user/profile.dart';
import 'package:flutter_application_1/Screens/user/routine.dart';
import 'package:flutter_application_1/constants/size_config.dart';


class CustomBottomNavigationBar extends StatefulWidget {
   const CustomBottomNavigationBar({
    super.key, 

    });
  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
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
        
          bottomNavigationBar: BottomNavigationBar(
            
            selectedItemColor: const Color.fromARGB(255, 238, 199, 199),
            backgroundColor: Colors.transparent,
            unselectedItemColor: Colors.white,
        
            onTap: (int index){
              setState(() {
                selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
                
            items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  label: "Menu",
                  icon: Icon(
                    CupertinoIcons.house_fill,
                    size: SizeConfig.screenHeight*0.03,
                  )
                ),
          
                BottomNavigationBarItem(
                  label: "Rutina",
                  icon: Icon(
                    CupertinoIcons.doc_text_fill,
                    size: SizeConfig.screenHeight*0.03,
                  )
                ),
          
                BottomNavigationBarItem(
                  label: "Perfil",
                  icon: Icon(
                    CupertinoIcons.person_circle_fill,
                    size: SizeConfig.screenHeight*0.03,
                  )
                ),
            ], 
          ),
        ),
      ),
    );
  }
}

