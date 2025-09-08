import 'package:flutter/material.dart';
import 'dart:math' as math;

// Custom Painter para los círculos de atributos
class AttributePainter extends CustomPainter {
  final double progressPercent;
  final double strokeWidth, filledStrokeWidth;
  final Paint bgPaint, strokeBgPaint, strokeFilledPaint;

  AttributePainter({
    required this.progressPercent,
    this.strokeWidth = 4.0,
    this.filledStrokeWidth = 8.0,
  })  : bgPaint = Paint()..color = Colors.white.withOpacity(0.25),
        strokeBgPaint = Paint()..color = const Color(0xffD264C9),
        strokeFilledPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = filledStrokeWidth
          ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Dibuja el círculo de fondo
    canvas.drawCircle(center, radius, bgPaint);

    // Dibuja el círculo interior de color
    canvas.drawCircle(center, radius - strokeWidth, strokeBgPaint);

    // Dibuja el arco de progreso
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - (strokeWidth / 2)),
      -math.pi / 2, // empieza desde arriba
      (progressPercent / 100) * math.pi * 2,
      false,
      strokeFilledPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Widget para mostrar atributos con progreso circular
class AttributeWidget extends StatelessWidget {
  final double size;
  final double progress;
  final Widget child;
  final double strokeWidth;
  final double filledStrokeWidth;

  const AttributeWidget({
    Key? key,
    required this.progress,
    this.size = 82,
    required this.child,
    this.strokeWidth = 4.0, // 👈 ahora personalizable
    this.filledStrokeWidth = 3.0, // 👈 ahora personalizable
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AttributePainter(
        progressPercent: progress,
        strokeWidth: strokeWidth,
        filledStrokeWidth: filledStrokeWidth,
      ),
      size: Size(size, size),
      child: Container(
        padding: EdgeInsets.all(size / 3.8),
        width: size,
        height: size,
        child: child,
      ),
    );
  }
}
