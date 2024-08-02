import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/login.dart';
import 'package:flutter_application_1/Services/auth.dart';
import 'package:flutter_application_1/components/custom_navigation_bar.dart';

// ignore: camel_case_types
class SignInOut extends StatelessWidget {
  const SignInOut({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStateChanges, 
      builder: (context, snapshot){
        if(snapshot.hasData){
          return const CustomNavigationBar();
        }else {
          return const Login(); 
        }
      }
    );
  }
}