import 'package:flutter/material.dart';
import 'package:phferreira/ui/about/widgets/cursor_digit_widget.dart';
import 'package:phferreira/ui/contact/widgets/cursor_widget.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> with TickerProviderStateMixin {
  double _time = 0;
  final String _name = 'Working on it ...';
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _time = 1 / (_name.length + 1);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int index = 0; index < _name.length; index++)
              CursorDigitWidget(
                letter: _name[index],
                controller: _animationController,
                begin: index * _time,
                end: (index + 1) * _time,
                fontSize: 32,
              ),
            _animationController.isCompleted
                ? FittedBox(
                    fit: BoxFit.fill,
                    child: CursorWidget(
                      color: onSurface,
                      size: 23,
                    ),
                  )
                : const SizedBox(width: 23 * 0.7),
          ],
        ),
      ),
    );
  }
}
