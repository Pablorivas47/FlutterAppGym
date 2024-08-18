import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class StopWatchTimer extends StatefulWidget {
  const StopWatchTimer({super.key});

  @override
  State<StopWatchTimer> createState() => _StopWatchTimerState();
}

class _StopWatchTimerState extends State<StopWatchTimer> {
  static const countDownDuration = Duration(hours: 3);
  Duration duration = const Duration();
  Timer? timer;
  bool isCountDown = true;

  @override
  void initState() {
    super.initState();
    reset();
  }

  void addTime() {
    final addSeconds = isCountDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void reset() {
    setState(() {
      if (isCountDown) {
        duration = countDownDuration;
      } else {
        duration = const Duration();
      }
    });
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isRunning = timer?.isActive ?? false;
    final isCompleted = duration.inSeconds == 0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTime(),
        SizedBox(height: SizeConfig.screenHeight * 0.015),
        buildButtons(isRunning, isCompleted),
      ],
    );
  }

  Widget buildButtons(bool isRunning, bool isCompleted) {
    if (isRunning) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.035,
            width: SizeConfig.screenWidth * 0.2,
            child: customCupButtonTimer(
                text: 'Parar',
                onPressed: () {
                  stopTimer(resets: false);
                }),
          ),
          SizedBox(width: SizeConfig.screenWidth * 0.02),
          SizedBox(
            height: SizeConfig.screenHeight * 0.035,
            width: SizeConfig.screenWidth * 0.2,
            child: customCupButtonTimer(
                text: 'Cancelar',
                onPressed: () {
                  stopTimer();
                }),
          ),
        ],
      );
    } else {
      return SizedBox(
        height: SizeConfig.screenHeight * 0.035,
        width: SizeConfig.screenWidth * 0.3,
        child: customCupButtonTimer(
            text: 'Entrenar',
            onPressed: () {
              startTimer(resets: isCompleted);
            }),
      );
    }
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(hours, 'Horas'),
        SizedBox(width: SizeConfig.screenWidth * 0.04),
        Container(
          width: SizeConfig.screenWidth * 0.0075,
          height: SizeConfig.screenHeight * 0.065,
          color: Colors.white,
        ),
        SizedBox(width: SizeConfig.screenWidth * 0.04),
        buildTimeCard(minutes, 'Minutos'),
        SizedBox(width: SizeConfig.screenWidth * 0.04),
        Container(
          width: SizeConfig.screenWidth * 0.0075,
          height: SizeConfig.screenHeight * 0.065,
          color: Colors.white,
        ),
        SizedBox(width: SizeConfig.screenWidth * 0.04),
        buildTimeCard(seconds, 'Segundos'),
      ],
    );
  }

  Widget buildTimeCard(String time, String header) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          time,
          style: TextStyle(
            fontSize: SizeConfig.screenWidth * 0.08,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.001),
        Text(
          header,
          style: TextStyle(
            fontSize: SizeConfig.screenWidth * 0.03,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
