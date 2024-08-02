import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/Services/routes.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main()  async { 
  WidgetsFlutterBinding.ensureInitialized(); //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderService()),
      ],
      builder: (context, _) {
        return const MyApp();
      },
    ),
  );
  
} //ejecuta la aplicacion


class MyApp extends StatelessWidget{

  const MyApp ({super.key});
  @override
  Widget build (BuildContext context){
    SizeConfig().init(context);
    return  MaterialApp(

      theme:  ThemeData( //Change color of the handle

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color.fromARGB(255, 238, 199, 199), // Color del item seleccionado
        ),

        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Colors.transparent, 
        ),
      ),

      title: "GYM PASS",
      initialRoute: '/signInOut',
      routes: routes,
      onGenerateRoute: (setting){
        return MaterialPageRoute(builder: (context){
          return const Page404();
        },);
      },
    );
  }
}





