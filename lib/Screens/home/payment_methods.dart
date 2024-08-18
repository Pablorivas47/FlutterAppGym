import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/stop_watch_timer.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
      )),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          text: "Metodos de pago",
          colorText: Colors.white,
          automaticallyImplyLeading: true,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
