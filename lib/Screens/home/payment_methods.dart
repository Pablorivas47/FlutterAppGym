import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:provider/provider.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final double amount = 100.0;

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
        appBar: const CustomAppBar(
          text: "Métodos de pago",
          colorText: Colors.white,
          automaticallyImplyLeading: true,
          padding: EdgeInsets.zero,
        ),
        body: Center(
          child: customCupButtonTimer(
              text: 'Pagar',
              onPressed: () async {
                context
                    .read<ProviderService>()
                    .providerUpdateHandlePayments(amount);
                Navigator.pushNamed(context, '/customNavBar');
              }),
        ),
      ),
    );
  }
}
