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
  circle_stepper: ^1.0.0

```
Then, run:
```dart
flutter pub get
```

## Usage

TODO: Include short and useful examples for package users. Add longer examples
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
Parameters:
* fillDirection: Choose between FillDirection.clockwise or FillDirection.counterClockwise.
* step: The current step number (starting from 1).
* totalSteps: The total number of steps in the process.
* stepTitles: A map that assigns titles to each step.
* stepDescriptions: A map that provides descriptions for each step.
* progressColor: The color of the progress indicator.
* backgroundColor: The background color behind the progress indicator.
* strokeWidth: The thickness of the circular progress indicator.


## Additional information
Additional Information
* For issues, feedback, or contributions, check out our GitHub repository.
* You can submit issues or feature requests via the issue tracker.
* Contributions are welcome! Fork the repository and create a pull request.
