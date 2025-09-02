library circle_stepper;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FilDirection.dart';

/// A customizable and animated circular stepper widget.
///
/// `CircleStepper` displays progress in a circular design with
/// step numbers, titles, and descriptions. It is useful for
/// onboarding flows, forms, quizzes, or any multi-step process.
class CircleStepper extends StatefulWidget {
  /// The width of the circular progress indicator.
  final double? width;

  /// The height of the circular progress indicator.
  final double? height;

  /// The current step index (must be between 1 and [totalSteps]).
  final int step;

  /// The total number of steps.
  final int totalSteps;

  /// The text displayed between the step and total steps.
  ///
  /// Example: "of", resulting in "2 of 5".
  final String betweenStepText;

  /// A map of step indexes to titles.
  ///
  /// Example: `{1: "Step One", 2: "Step Two"}`.
  final Map<int, String> stepTitles;

  /// A map of step indexes to descriptions.
  ///
  /// Example: `{1: "Introduction", 2: "Details"}`.
  final Map<int, String> stepDescriptions;

  /// The color of the progress arc.
  final Color progressColor;

  /// The background color of the circular progress track.
  final Color backgroundColor;

  /// The text style used for the step indicator inside the circle.
  final TextStyle? textStyleStepper;

  /// The text style used for step titles.
  final TextStyle? textStyleTitle;

  /// The text style used for step descriptions.
  final TextStyle? textStyleDescriptions;

  /// The color of the step text (inside the circle).
  final Color colorTextStepper;

  /// The color of the step title text.
  final Color colorTitle;

  /// The color of the step description text.
  final Color colorDescriptions;

  /// The direction in which the progress is filled.
  final FillDirection fillDirection;

  /// The stroke width of the circular progress indicator.
  final double? strokeWidth;

  /// The font family applied to stepper texts.
  final String? fontFamily;

  /// Creates a [CircleStepper].
  const CircleStepper({
    Key? key,
    this.width,
    this.height,
    required this.step,
    required this.totalSteps,
    required this.betweenStepText,
    required this.stepTitles,
    required this.stepDescriptions,
    required this.progressColor,
    required this.backgroundColor,
    this.textStyleStepper,
    this.textStyleTitle,
    this.textStyleDescriptions,
    this.colorTextStepper = Colors.black,
    this.colorTitle = Colors.black,
    this.colorDescriptions = Colors.grey,
    this.fillDirection = FillDirection.clockwise,
    this.strokeWidth,
    this.fontFamily,
  }) : super(key: key);

  @override
  State<CircleStepper> createState() => _CircleStepperState();
}

class _CircleStepperState extends State<CircleStepper> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  double _previousProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  /// Initializes the animation controller and sets the initial progress.
  void _initializeAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _setAnimationProgress(widget.step / widget.totalSteps);
    _animationController.forward();
  }

  /// Updates the animation progress with a new value.
  void _setAnimationProgress(double newProgress) {
    _progressAnimation = Tween<double>(
      begin: _previousProgress,
      end: newProgress,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _previousProgress = newProgress;
  }

  @override
  void didUpdateWidget(covariant CircleStepper oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.step != oldWidget.step || widget.totalSteps != oldWidget.totalSteps) {
      double newProgress = widget.step / widget.totalSteps;
      _setAnimationProgress(newProgress);
      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final double width = widget.width ?? size.height * .061;
    final double height = widget.height ?? size.height * .061;

    return SizedBox(
      height: height,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              _buildCircularProgressIndicator(width, height),
              SizedBox(
                width: width - 20,
                height: height,
                child: _buildProgressText(context),
              ),
            ],
          ),
          SizedBox(width: size.width * .03),
          _buildStepInfo(context),
        ],
      ),
    );
  }

  /// Builds the circular progress indicator with animation.
  Widget _buildCircularProgressIndicator(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      child: RotatedBox(
        quarterTurns: 90,
        child: AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, child) {
            return Transform(
              transform: widget.fillDirection == FillDirection.clockwise ? Matrix4.identity() : Matrix4.rotationY(3.14159),
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
                color: widget.progressColor,
                backgroundColor: widget.backgroundColor,
                value: _progressAnimation.value,
                strokeWidth: widget.strokeWidth ?? (width / height) * 5,
              ),
            );
          },
        ),
      ),
    );
  }

  /// Builds the text showing the current step out of total steps.
  Widget _buildProgressText(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        '${widget.step} ${widget.betweenStepText} ${widget.totalSteps}',
        style: widget.textStyleStepper ??
            TextStyle(
              fontSize: MediaQuery.of(context).size.width * .03,
              fontWeight: FontWeight.w500,
              color: widget.colorTextStepper,
              fontFamily: widget.fontFamily ?? 'Poppins',
            ),
      ),
    );
  }

  /// Builds the step title and description section.
  Widget _buildStepInfo(BuildContext context) {
    return SizedBox(
      height: widget.height ?? MediaQuery.of(context).size.height * .061,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.stepTitles[widget.step] ?? '',
              style: widget.textStyleTitle ??
                  TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .034,
                    fontWeight: FontWeight.w600,
                    color: widget.colorTitle,
                    fontFamily: 'Poppins',
                  ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .01),
            Text(
              widget.stepDescriptions[widget.step] ?? '',
              style: widget.textStyleDescriptions ??
                  TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .029,
                    fontWeight: FontWeight.w400,
                    color: widget.colorDescriptions,
                    fontFamily: 'Poppins',
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
