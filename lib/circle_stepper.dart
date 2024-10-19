library circle_stepper;


import 'package:flutter/material.dart';

class CircleStepper extends StatefulWidget {
  final int step; // Current step value
  final int totalSteps; // Total number of steps
  final String betweenStepText; // Total number of steps
  final Map<int, String> stepTitles; // Map of step number to title
  final Map<int, String> stepDescriptions; // Map of step number to description
  final Color progressColor; // Color of the progress bar
  final Color backgroundColor;
  final String fontFamily = 'Poppins';
  final Color colorTextStepper = Colors.black;
  final Color colorTitle = Colors.black;
  final Color colorDescriptions = Colors.grey;
  final TextDirection direction;

  const CircleStepper({
    Key? key,
    required this.step,
    required this.totalSteps,
    required this.betweenStepText,
    required this.stepTitles,
    required this.stepDescriptions,
    required this.progressColor,
    required this.backgroundColor,
    required this.direction,
  }) : super(key: key);

  @override
  State<CircleStepper> createState() => _CircleStepperState();
}

class _CircleStepperState extends State<CircleStepper> with SingleTickerProviderStateMixin {
  late AnimationController _animationController; // Controller for animation
  late Animation<double> _progressAnimation; // Animation for progress value
  double _previousProgress = 0.0; // Track the previous progress

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Duration of animation
    );

    // Initialize the progress animation with the current step value
    _progressAnimation = Tween<double>(
      begin: _previousProgress,
      end: widget.step / widget.totalSteps,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant CircleStepper oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Calculate the new progress based on the step and total steps
    double newProgress = widget.step / widget.totalSteps;

    // Update the animation to transition from the current to the new progress
    _progressAnimation = Tween<double>(
      begin: _progressAnimation.value, // Start from current progress
      end: newProgress, // End at new progress
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Restart the animation from the current position
    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose of the animation controller
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
                      return CircularProgressIndicator(
                        color: widget.progressColor,
                        backgroundColor: widget.backgroundColor,
                        value: _progressAnimation.value, // Animated progress value
                        strokeWidth: 6,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                child: Text(
                  '${widget.step} ${widget.betweenStepText} ${widget.totalSteps}', // Dynamic step text
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
            height: MediaQuery.sizeOf(context).height * .061,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.stepTitles[widget.step] ?? '', // Dynamic title based on step
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .034,
                    fontWeight: FontWeight.w600,
                    color: widget.colorTitle,
                    fontFamily: widget.fontFamily,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.stepDescriptions[widget.step] ?? '', // Dynamic description based on step
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
