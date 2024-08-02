import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/components/form_validation.dart';
import 'package:flutter_application_1/constants/errores/validation_error_manager.dart';
import 'package:flutter_application_1/constants/errores/validation_error_messages.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class ForgetPassword extends StatefulWidget {
  
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController eMailController = TextEditingController();
  Map<String, String?> errorsForget = {};
  Timer? timer;

  void forgetPassword (){
    setState(() {
      errorsForget = forgetPasswordMap(
        errorsForget,
        eMailController.text,
    );
    if (errorsForget.isNotEmpty) {
        startErrorTimerForget();
      } else {
        timer?.cancel();
      }
    });
  }

   void startErrorTimerForget() {
    timer = Timer(defaultDuration, () {
      setState(() {
        errorsForget.clear();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
          )
      ),
      child:  Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const  CustomAppBar(
          text: "Restaurar contraseña" , 
          colorText: Colors.white, 
          automaticallyImplyLeading: true, 
          padding: EdgeInsets.zero,
          ),
        body: Column(
          children: <Widget> [

          
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.09 , right:SizeConfig.screenWidth*0.09 ),
              child:  Text("Indique su E-Mail para recuperar su contraseña", 
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontFamily: "Inter",
                fontSize: SizeConfig.screenWidth*0.04,
                fontWeight: FontWeight.w300,
                ),
              ),
            ),

            SizedBox(
              height: SizeConfig.screenHeight*0.025,
            ),

            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth*0.09
                ),
              child: eMailTextFormField(
                eMailController, 
                hintText: "E-Mail", 
                fontSizeTextStyle: SizeConfig.screenHeight*0.02, 
                fontWeightTextStyle: FontWeight.w400, 
                contentPadding: EdgeInsets.symmetric(
                  horizontal:SizeConfig.screenWidth*0.04, 
                  vertical:SizeConfig.screenHeight*0.02,
                ), 
                fontSizeHintText: SizeConfig.screenHeight*0.02, 
                fontWeightHintText: FontWeight.w200, 
                colorHintText: Colors.white,
                filled: false,
                cursorColor: Colors.white, 
                colorTextIn: Colors.white, 
                colorIcon: Colors.white, 
                sizeIcon: SizeConfig.screenWidth*0.05, 
                borderRadius: BorderRadius.circular(7), 
                colorBorderRadiusOutline: const Color.fromARGB(255, 238, 199, 199), 
                colorEnableBorder: Colors.white70, 
              ),
            ),

            FormValidationMap(
              errors: errorsForget, 
              //controller: eMailController, 
              textController: 'email', 
              padding: EdgeInsets.only(
                left:SizeConfig.screenWidth * 0.075 ,
                top: SizeConfig.screenHeight * 0.005
                ),
              ),
            
            SizedBox(
              height: SizeConfig.screenHeight*0.025,
            ),

            
            CustomButton(
              color: const Color(0xFF246B84) , 
              text: "Crear cuenta", 
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.screenWidth*0.02)
                ), 
              padding: EdgeInsets.symmetric(
                vertical:SizeConfig.screenHeight*0.0175, 
                horizontal:SizeConfig.screenWidth*0.295
              ),
              alignment: Alignment.center, 
              press: () { 
                forgetPassword();
                if(errorsForget.isEmpty){
                  Navigator.pop(context);
                }

               },              
              ),         
          ],
        ),
      ),
    );
  }
}