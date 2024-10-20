import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<Color> color;
  final int step; // Step input to control the current page

  const ImageSlider({
    Key? key,
    required this.color,
    required this.step, // Required step input
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.step; // Set initial page to the passed step value
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void didUpdateWidget(covariant ImageSlider oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If step is updated, animate to the new page
    if (widget.step != _currentPage) {
      setState(() {
        _currentPage = widget.step;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: widget.color.length,
        itemBuilder: (context, index) {
          return _buildColorSlide(widget.color[index]);
        },
      ),
    );
  }

  Widget _buildColorSlide(Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        color: color,
      ),
    );
  }
}
