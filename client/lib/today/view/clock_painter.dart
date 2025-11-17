import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  const ClockPainter({
    this.dayProgressPercentage = 0.0,
    this.color = Colors.blue,
  });

  final Color color;
  final double dayProgressPercentage;

  @override
  void paint(Canvas canvas, Size size) {
    const annotationStyle = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    final topPainter = TextPainter(
      text: const TextSpan(
        text: 'start',
        style: annotationStyle,
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final bottomPainter = TextPainter(
      text: const TextSpan(
        text: 'halfway',
        style: annotationStyle,
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final strokeWidth = size.width / 20;
    final radius = (size.width - strokeWidth) / 2;
    final backgroundPaint = Paint()..color = Colors.white;
    final foregroundPaint = Paint()..color = color;

    final center = Offset(size.width / 2, size.height / 2);

    topPainter.layout();
    bottomPainter.layout();

    final top = Offset(
      center.dx - (topPainter.width / 2),
      center.dy - radius - strokeWidth - (topPainter.height / 2),
    );

    final bottom = Offset(
      center.dx - (bottomPainter.width / 2),
      center.dy + radius + strokeWidth - (bottomPainter.height / 2),
    );

    topPainter.paint(canvas, top);
    bottomPainter.paint(canvas, bottom);

    if (dayProgressPercentage < 100) {
      canvas
        ..drawCircle(center, radius, backgroundPaint)
        ..drawArc(
          Rect.fromCircle(center: center, radius: radius),
          -pi / 2,
          2 * pi * dayProgressPercentage,
          true,
          foregroundPaint,
        );
    } else {
      canvas.drawRect(
        Rect.fromCircle(center: center, radius: radius),
        foregroundPaint..color = Colors.green,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
