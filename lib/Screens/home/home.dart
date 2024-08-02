import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final userS = FirebaseAuth.instance.currentUser;
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     context.watch<ProviderService>().providerGetUserData();
  //   });
  // }

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
        body: FutureBuilder(
          future: getGYM(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } 
            else {
              var gyms = snapshot.data;
              return ListView.builder(
                itemCount: gyms?.length,
                itemBuilder: (BuildContext context, int index) {
                  var gymData = gyms?[index];
                  String name = gymData['name'] ?? 'Unnamed Gym'; // Manejo de nulos
                  return ListTile(
                    title: Text(
                      name, 
                      style: const TextStyle( 
                        color: Colors.white
                        ),),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}