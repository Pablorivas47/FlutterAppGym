import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/admin/components/admin_screen.dart';
import 'package:flutter_application_1/Screens/login.dart';
import 'package:flutter_application_1/Screens/user/components/user_screen.dart';
import 'package:flutter_application_1/Services/auth.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';

class SignInOut extends StatelessWidget {
  const SignInOut({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var user = snapshot.data;
          return FutureBuilder<bool>(
            future: isAdmin(user!.uid), // Primero verificamos si es admin
            builder: (context, adminSnapshot) {
              if (adminSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (adminSnapshot.hasData && adminSnapshot.data!) {
                return const AdminScreen(); // Si es admin, mostramos la pantalla del admin
              } else {
                // Si no es admin, verificamos si es user
                return FutureBuilder<bool>(
                  future: isUser(user.uid),
                  builder: (context, userSnapshot) {
                    if (userSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (userSnapshot.hasData && userSnapshot.data!) {
                      return const UserScreen(); // Si es user, mostramos la pantalla de usuario
                    } else {
                      return const Login(); // Si no es admin ni user, mostramos el login
                    }
                  },
                );
              }
            },
          );
        } else {
          return const Login(); // Si no hay sesión iniciada, mostramos la pantalla de login
        }
      },
    );
  }
}
