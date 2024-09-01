import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/forget_password.dart';
import 'package:flutter_application_1/Screens/home/gym_information.dart';
import 'package:flutter_application_1/Screens/home/gyms.dart';
import 'package:flutter_application_1/Screens/home/home.dart';
import 'package:flutter_application_1/Screens/home/payment_methods.dart';
import 'package:flutter_application_1/Screens/home/shifts.dart';
import 'package:flutter_application_1/Screens/login.dart';
import 'package:flutter_application_1/Screens/page_404.dart';
import 'package:flutter_application_1/Screens/password_and_security.dart';
import 'package:flutter_application_1/Screens/personal_information.dart';
import 'package:flutter_application_1/Screens/sign_in_up.dart';
import 'package:flutter_application_1/Screens/sign_up.dart';
import 'package:flutter_application_1/Screens/routine.dart';
import 'package:flutter_application_1/Screens/profile.dart';
import 'package:flutter_application_1/api/google-maps.dart';
import 'package:flutter_application_1/components/custom_navigation_bar.dart';
import 'package:flutter_application_1/components/custom_bottom_navigation_bar.dart';
import 'package:flutter_application_1/components/custom_n_b.dart';
export 'package:flutter_application_1/Screens/page_404.dart';
export 'package:flutter_application_1/Screens/routine.dart';
export 'package:flutter_application_1/Screens/profile.dart';
export 'package:flutter_application_1/Screens/home/home.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (context) {
    return const Login();
  },
  '/forgetPassword': (context) {
    return const ForgetPassword();
  },
  '/singUp': (context) {
    return const SignUp();
  },
  '/home': (context) {
    return const Home();
  },
  '/page404': (context) {
    return const Page404();
  },
  '/routine': (context) {
    return const Routine();
  },
  '/profile': (context) {
    return const Profile();
  },
  '/customBotNavBar': (context) {
    return const CustomBottomNavigationBar();
  },
  '/customNavBar': (context) {
    return const CustomNavigationBar();
  },
  '/cNb': (context) {
    return const CustomNB();
  },
  '/personalInformation': (context) {
    return const PersonalInformation();
  },
  '/signInOut': (context) {
    return const SignInOut();
  },
  '/passwordAndSecurity': (context) {
    return const PasswordAndSecurity();
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
  '/googleMaps': (context) {
    return const GoogleMaps();
  },
};
