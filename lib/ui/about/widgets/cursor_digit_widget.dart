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

class _CursorDigitWidgetState extends State<CursorDigitWidget>
    with TickerProviderStateMixin {
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
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    if (widget.controller.value < widget.begin) {
      return SizedBox(
        height: widget.fontSize * 1.2,
        width: widget.fontSize * 0.7,
      );
    }

    return AnimatedBuilder(
      animation: widget.controller,
      builder: (BuildContext context, Widget? child) {
        final animationValue = _curvedAnimation.value;
        final animationColor =
            Color.lerp(onSurface, Colors.transparent, animationValue);
        final animationColorText =
            Color.lerp(Colors.transparent, onSurface, animationValue);

        return Container(
          height: widget.fontSize * 1.2,
          width: widget.fontSize * 0.7,
          color: animationColor,
          child: Text(
            widget.letter,
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: widget.fontSize,
              color: animationColorText,
            ),
          ),
        );
      },
    );
  }
}
