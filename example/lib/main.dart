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
          child: Container(
            height: 300,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: CircleStepper(
                direction: TextDirection.ltr,
                step: 1,
                totalSteps: 4,
                betweenStepText: 'از',
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
                backgroundColor: Colors.grey.withAlpha(100),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
