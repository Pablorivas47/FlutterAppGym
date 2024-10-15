import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/admin/admin_home.dart';
import 'package:flutter_application_1/Screens/admin/admin_personal_information.dart';
import 'package:flutter_application_1/Screens/admin/admin_profile.dart';
import 'package:flutter_application_1/Screens/forget_password.dart';
import 'package:flutter_application_1/Screens/user/home/gyms.dart';
import 'package:flutter_application_1/Screens/user/home/home.dart';
import 'package:flutter_application_1/Screens/user/home/location.dart';
import 'package:flutter_application_1/Screens/user/home/payment_methods.dart';
import 'package:flutter_application_1/Screens/user/home/shifts.dart';
import 'package:flutter_application_1/Screens/login.dart';
import 'package:flutter_application_1/Screens/user/password_and_security.dart';
import 'package:flutter_application_1/Screens/user/personal_information.dart';
import 'package:flutter_application_1/Screens/user/routine.dart';
import 'package:flutter_application_1/Services/sign_in_up.dart';
import 'package:flutter_application_1/Screens/sign_up.dart';
import 'package:flutter_application_1/Screens/user/profile.dart';
import 'package:flutter_application_1/components/custom_navigation_bar.dart';
import 'package:flutter_application_1/components/custom_bottom_navigation_bar.dart';
import 'package:flutter_application_1/Screens/user/components/user_screen.dart';

final Map<String, WidgetBuilder> routes = {
  //---------------------------   General Routes  ---------------------------
  '/login': (context) {
    return const Login();
  },
  '/forgetPassword': (context) {
    return const ForgetPassword();
  },
  '/singUp': (context) {
    return const SignUp();
  },
  '/customBotNavBar': (context) {
    return const CustomBottomNavigationBar();
  },
  '/customNavBar': (context) {
    return const CustomNavigationBar();
  },
  '/cNb': (context) {
    return const UserScreen();
  },
  '/signInOut': (context) {
    return const SignInOut();
  },
  '/passwordAndSecurity': (context) {
    return const PasswordAndSecurity();
  },
  '/location': (context) {
    return const LocationMaps();
  },
  //---------------------------   User Routes  ---------------------------

  '/home': (context) {
    return const Home();
  },
  '/routine': (context) {
    return const Routine();
  },
  '/profile': (context) {
    return const Profile();
  },
  '/personalInformation': (context) {
    return const PersonalInformation();
  },
  '/gyms': (context) {
    return const Gyms();
  },
  '/paymentMethods': (context) {
    return const PaymentMethods();
  },
  '/shifts': (context) {
    return const Shifts();
  },
  //---------------------------   Admin Routes  ---------------------------

  '/adminHome': (context) {
    return const AdminHome();
  },
  '/adminProfile': (context) {
    return const AdminProfile();
  },
  '/adminRoutine': (context) {
    return const AdminProfile();
  },
  '/adminPersonalInformation': (context) {
    return const AdminPersonalInformation();
  },
};
