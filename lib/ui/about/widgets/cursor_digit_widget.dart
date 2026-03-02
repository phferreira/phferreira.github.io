import 'package:flutter/material.dart';

class CursorDigitWidget extends StatefulWidget {
  final String letter;
  final AnimationController controller;
  final double begin;
  final double end;
  final double fontSize;

  const CursorDigitWidget({
    super.key,
    required this.letter,
    required this.controller,
    required this.begin,
    required this.end,
    required this.fontSize,
  });

  @override
  State<CursorDigitWidget> createState() => _CursorDigitWidgetState();
}

class _CursorDigitWidgetState extends State<CursorDigitWidget> with TickerProviderStateMixin {
  late Animation _animationColor;
  late Animation _animationColorText;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _curvedAnimation = CurvedAnimation(
      parent: widget.controller,
      curve: Interval(
        widget.begin,
        widget.end,
      ),
    );

    widget.controller.forward();
    _animationColor = ColorTween(begin: Colors.black87, end: Colors.transparent).animate(_curvedAnimation);
    _animationColorText = ColorTween(begin: Colors.transparent, end: Colors.black87).animate(_curvedAnimation);

    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.value < widget.begin) {
      return SizedBox(
        height: widget.fontSize * 1.2,
        width: widget.fontSize * 0.7,
      );
    }
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          height: widget.fontSize * 1.2,
          width: widget.fontSize * 0.7,
          color: _animationColor.value,
          child: Text(
            widget.letter,
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: widget.fontSize,
              color: _animationColorText.value,
            ),
          ),
        );
      },
    );
  }
}
