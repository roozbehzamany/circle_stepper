import 'package:circle_stepper/FilDirection.dart';
import 'package:circle_stepper/circle_stepper.dart';
import 'package:flutter/material.dart';

import 'ImageSlider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int step = 1;

  final int totalSteps = 4;
 // Total steps for the slider
  void _increaseStep() {
    setState(() {
      if (step < totalSteps) {
        step++; // Increase step but ensure it doesn't exceed totalSteps
      }
    });
  }

  void _decreaseStep() {
    setState(() {
      if (step > 1) {
        step--; // Decrease step but ensure it doesn't go below 0
      }
    });
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: CircleStepper(
                      fillDirection: FillDirection.clockwise,
                      step: step,
                      totalSteps: totalSteps,
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
                      progressColor: Colors.greenAccent,
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
                        step: step,
                        totalSteps: totalSteps,
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
                        progressColor: Colors.green,
                        backgroundColor: Colors.grey.withAlpha(50),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: ImageSlider(
                  color: [
                    Colors.red,
                    Colors.amber,
                    Colors.blue,
                    Colors.pink,
                  ],
                  step: step-1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _decreaseStep, // Button to decrease step
                    child: const Text('Previous Step'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _increaseStep, // Button to increase step
                    child: const Text('Next Step'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
