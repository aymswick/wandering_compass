import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  const ClockPainter({
    this.progress = 0.0,
    this.color = Colors.blue,
  });

  final Color color;
  final double progress;
  final double maxTicks;
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final strokeWidth = size.width / 20;
    final radius = (size.width - strokeWidth) / 2;

    final strokePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final backgroundPaint = Paint()..color = Colors.white;
    final foregroundPaint = Paint()..color = color;

    final textPainter =
        TextPainter(
            text: TextSpan(text: '$progress'),
            textDirection: TextDirection.ltr,
          )
          ..layout(
            maxWidth: size.width,
          )
          ..paint(canvas, center);

    // 1440 minutes in a day

    canvas
      ..drawCircle(center, radius, backgroundPaint)
      ..drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        pi * (progress * .01), // circle maxes out at progress = 200
        true,
        foregroundPaint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
