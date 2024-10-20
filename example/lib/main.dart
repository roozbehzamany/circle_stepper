import 'package:circle_stepper/FilDirection.dart';
import 'package:circle_stepper/circle_stepper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circle Stepper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: CircleStepper(
                  fillDirection: FillDirection.clockwise,
                  step: 1,
                  totalSteps: 4,
                  betweenStepText: 'of',
                  stepTitles: const {
                    1: 'Step 1',
                    2: 'Step 2',
                    3: 'Step 3',
                    4: 'Step 4',
                  },
                  stepDescriptions: const {
                    1: 'Description 1',
                    2: 'Description 2',
                    3: 'Description 3',
                    4: 'Description 4',
                  },
                  progressColor: Colors.amber,
                  backgroundColor: Colors.grey.withAlpha(50),
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: CircleStepper(
                    fillDirection: FillDirection.counterClockwise,
                    step: 1,
                    totalSteps: 4,
                    betweenStepText: 'از',
                    stepTitles: const {
                      1: 'مرحله 1',
                      2: 'مرحله 2',
                      3: 'مرحله 3',
                      4: 'مرحله 4',
                    },
                    stepDescriptions: const {
                      1: 'توضیحات 1',
                      2: 'توضیحات 2',
                      3: 'توضیحات 3',
                      4: 'توضیحات 4',
                    },
                    progressColor: Colors.amber,
                    backgroundColor: Colors.grey.withAlpha(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
