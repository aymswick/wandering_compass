import 'package:flutter/material.dart';
import 'package:wanderers_compass/today/view/clock/clock_painter.dart';

class CircularCountdownClock extends StatelessWidget {
  const CircularCountdownClock({
    required this.progress,
    super.key,
  });

  /// Decimal between 0.0 and 1.0 representing day progress
  final double progress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return CustomPaint(
      size: Size(size.height * .4, size.width / 2),
      painter: ClockPainter(
        dayProgressPercentage: progress,
      ),
      child: Center(
        child: Text(
          '${(progress * 100).toStringAsFixed(0)}%',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
