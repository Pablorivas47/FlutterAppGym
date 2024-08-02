import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/routes.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Routine(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Color _getItemColor(int index) {
    if (selectedIndex == index) {
      return const Color.fromARGB(255, 238, 199, 199);
    } else {
      return const Color.fromARGB(255, 255, 255, 255);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          
          
          splashFactory: NoSplash.splashFactory,
          splashColor: const Color.fromARGB(255, 44, 30, 233),
          highlightColor: Colors.red,
          
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,

          body: IndexedStack(
            index: selectedIndex,
            children: _widgetOptions,
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent, // Color de fondo opcional
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              
              children: <Widget>[

                CupertinoButton(
                  onPressed: (){
                    return _onItemTapped(0);
                  },
                  child: Icon(
                    CupertinoIcons.house_fill,
                    size: SizeConfig.screenHeight*0.03,
                    color: _getItemColor(0),
                  ),
                ),
                
                CupertinoButton(
                  onPressed: (){
                    return _onItemTapped(1);
                  },
                  child: Icon(
                    CupertinoIcons.doc_text_fill,
                    size: SizeConfig.screenHeight*0.03,
                    color: _getItemColor(1),
                  ),
                ),
                
                CupertinoButton(
                  onPressed: (){
                    return _onItemTapped(2);
                  },
                  child: Icon(
                    CupertinoIcons.person_fill,
                    size: SizeConfig.screenHeight*0.03,
                    color: _getItemColor(2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}