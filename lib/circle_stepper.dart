library circle_stepper;


import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

enum FillDirection {
  clockwise,
  counterClockwise,
}

class CircleStepper extends StatefulWidget {
  final int step;
  final int totalSteps;
  final String betweenStepText;
  final Map<int, String> stepTitles;
  final Map<int, String> stepDescriptions;
  final Color progressColor;
  final Color backgroundColor;
  final String fontFamily;
  final Color colorTextStepper;
  final Color colorTitle;
  final Color colorDescriptions;
  final FillDirection fillDirection; // New property

  const CircleStepper({
    Key? key,
    required this.step,
    required this.totalSteps,
    required this.betweenStepText,
    required this.stepTitles,
    required this.stepDescriptions,
    required this.progressColor,
    required this.backgroundColor,
    this.fontFamily = 'Poppins',
    this.colorTextStepper = Colors.black,
    this.colorTitle = Colors.black,
    this.colorDescriptions = Colors.grey,
    this.fillDirection = FillDirection.clockwise, // Default is clockwise
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

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _progressAnimation = Tween<double>(
      begin: _previousProgress,
      end: widget.step / widget.totalSteps,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant CircleStepper oldWidget) {
    super.didUpdateWidget(oldWidget);

    double newProgress = widget.step / widget.totalSteps;

    _progressAnimation = Tween<double>(
      begin: _progressAnimation.value,
      end: newProgress,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .061,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).height * .061,
                height: MediaQuery.sizeOf(context).height * .061,
                child: RotatedBox(
                  quarterTurns: 90,
                  child: AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      // Apply a transform based on the selected direction
                      return Transform(
                        transform: widget.fillDirection == FillDirection.clockwise
                            ? Matrix4.identity() // No transformation for clockwise
                            : Matrix4.rotationY(3.14159), // Rotate 180 degrees for counter-clockwise
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: widget.progressColor,
                          backgroundColor: widget.backgroundColor,
                          value: _progressAnimation.value,
                          strokeWidth: 6,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                child: Text(
                  '${widget.step} ${widget.betweenStepText} ${widget.totalSteps}',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .03,
                    fontWeight: FontWeight.w500,
                    color: widget.colorTextStepper,
                    fontFamily: widget.fontFamily,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 18),
          SizedBox(
            height: MediaQuery.of(context).size.height * .061,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.stepTitles[widget.step] ?? '',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .034,
                    fontWeight: FontWeight.w600,
                    color: widget.colorTitle,
                    fontFamily: widget.fontFamily,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.stepDescriptions[widget.step] ?? '',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .029,
                    fontWeight: FontWeight.w400,
                    color: widget.colorDescriptions,
                    fontFamily: widget.fontFamily,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
