import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class FormValidationMap extends StatelessWidget {
  final Map<String, String?> errors;
  //final TextEditingController controller;
  final String textController;
  final EdgeInsets padding;
  const FormValidationMap({
    super.key,
    required this.errors,
    //required this.controller,
    required this.textController,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errors[textController] != null)
          formErrorText(
            error: errors[textController],
            context: context,
            padding: padding,
          ),
      ],
    );
  }
}

Padding formErrorText({
  String? error,
  required BuildContext context,
  required EdgeInsets padding,
}) {
  return Padding(
    padding: padding,
    child: Row(
      children: [
        SizedBox(width: SizeConfig.screenWidth * 0.015),
        Icon(
          CupertinoIcons.xmark_octagon,
          size: SizeConfig.screenHeight * 0.015,
          color: const Color.fromARGB(255, 255, 0, 0),
        ),
        SizedBox(width: SizeConfig.screenWidth * 0.01),
        Text(
          error!,
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontFamily: "Inter",
            fontSize: SizeConfig.screenHeight * 0.015,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    ),
  );
}
