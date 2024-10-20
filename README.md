<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

CircleStepper
A customizable, animated circular stepper widget for Flutter, designed to visualize progress across multiple steps. With customizable colors, titles, descriptions, and progress directions, CircleStepper adds a visually appealing and interactive element to your Flutter applications.

## Web
![Demo_web](https://github.com/user-attachments/assets/6035c264-7e7e-435c-8af3-2352d960f336)



https://github.com/user-attachments/assets/98539762-1dda-4daa-86cb-a3a161b1beaf





## Features


* Animated Circular Progress: Smooth animations between steps, indicating progress visually.
* Customizable Appearance: Easily configure colors, titles, descriptions, and fonts for each step.
* Direction Control: Choose between clockwise or counter-clockwise progress directions.
* Multiple Steps: Define the number of steps and track progress dynamically.
* Responsiveness: Designed to adapt to different screen sizes.

## Getting started

Installation
Add circle_stepper to your project's pubspec.yaml dependencies:
```dart
dependencies:
  circle_stepper: ^1.0.1

```
Then, run:
```dart
flutter pub get
```

## Usage

Include short and useful examples for package users. Add longer examples
to `/example` folder.

Here is a simple example of how to use the CircleStepper widget:

```dart
    CircleStepper(
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

```
## Parameters:

| Parameter            | Type         | Description                                                                                 |
|:---------------------|:-------------|:--------------------------------------------------------------------------------------------|
| `width`              | `double?`    | Width of the circular stepper. If null, defaults to a calculated height value.               |
| `height`             | `double?`    | Height of the circular stepper. If null, defaults to a calculated width value.               |
| `step`               | `int`        | The current step to display, must be between 1 and `totalSteps`.                             |
| `totalSteps`         | `int`        | Total number of steps to be shown in the stepper.                                            |
| `betweenStepText`    | `String`     | Text to display between the current step and the total steps.                                |
| `stepTitles`         | `Map<int, String>` | A map of step titles corresponding to each step number.                                      |
| `stepDescriptions`   | `Map<int, String>` | A map of step descriptions corresponding to each step number.                                |
| `progressColor`      | `Color`      | Color for the progress fill in the circular stepper.                                         |
| `backgroundColor`    | `Color`      | Background color for the circular progress bar.                                              |
| `textStyleStepper`   | `TextStyle?` | Custom text style for the stepper text (e.g., "1 of 4").                                     |
| `textStyleTitle`     | `TextStyle?` | Custom text style for the step titles.                                                       |
| `textStyleDescriptions` | `TextStyle?` | Custom text style for the step descriptions.                                                 |
| `colorTextStepper`   | `Color`      | Color of the stepper text. Defaults to `Colors.black`.                                       |
| `colorTitle`         | `Color`      | Color of the step titles. Defaults to `Colors.black`.                                        |
| `colorDescriptions`  | `Color`      | Color of the step descriptions. Defaults to `Colors.grey`.                                   |
| `fillDirection`      | `FillDirection` | Direction in which the circular progress fills (clockwise or counterclockwise).              |
| `strokeWidth`        | `double?`    | Width of the progress circle stroke. Default is 6.                                           |


## Advanced Usage
```dart
CircleStepper(
  step: 3,
  totalSteps: 5,
  betweenStepText: 'of',
  stepTitles: const {
    1: 'Intro',
    2: 'Basics',
    3: 'Intermediate',
    4: 'Advanced',
    5: 'Complete',
  },
  stepDescriptions: const {
    1: 'Introduction to the topic.',
    2: 'Learning the basic concepts.',
    3: 'Understanding intermediate topics.',
    4: 'Mastering advanced techniques.',
    5: 'Completion of the course.',
  },
  progressColor: Colors.greenAccent,
  backgroundColor: Colors.grey.withAlpha(50),
  colorTextStepper: Colors.blue,         // Custom text color
  colorTitle: Colors.black,              // Custom title color
  colorDescriptions: Colors.deepPurple,  // Custom description color
  textStyleStepper: const TextStyle(     // Custom text style for stepper text
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
  textStyleTitle: const TextStyle(       // Custom text style for title
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
  textStyleDescriptions: const TextStyle(// Custom text style for description
    fontSize: 16,
    fontStyle: FontStyle.italic,
  ),
)

```



## Additional information

* For issues, feedback, or contributions, check out our GitHub repository.
* You can submit issues or feature requests via the issue tracker.
* Contributions are welcome! Fork the repository and create a pull request.
