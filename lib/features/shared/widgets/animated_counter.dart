import 'package:flutter/material.dart';

/// Animated counter widget that counts from 0 to target value
class AnimatedCounter extends StatefulWidget {
  final int targetValue;
  final TextStyle? textStyle;
  final Duration duration;
  final String? suffix;
  final String? prefix;

  const AnimatedCounter({
    super.key,
    required this.targetValue,
    this.textStyle,
    this.duration = const Duration(seconds: 2),
    this.suffix,
    this.prefix,
  });

  @override
  State<AnimatedCounter> createState() => AnimatedCounterState();
}

class AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _animation = IntTween(
      begin: 0,
      end: widget.targetValue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  void startAnimation() {
    if (!_hasStarted) {
      // Start the animation only if it hasn't run yet
      _controller.forward();
      _hasStarted = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Text(
          '${widget.prefix ?? ''}${_animation.value}${widget.suffix ?? ''}',
          style: widget.textStyle,
        );
      },
    );
  }
}
