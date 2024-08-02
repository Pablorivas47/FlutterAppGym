import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: FutureBuilder(
        future: getGYM(),
        builder: ((context, snapshot) {
            return const Text('Hola');
        }
      ),
      ),
    );
  }
}