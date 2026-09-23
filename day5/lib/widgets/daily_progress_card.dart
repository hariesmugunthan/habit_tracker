import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// DailyProgressCard displays habit completion stats and a gradient circular ring.
class DailyProgressCard extends StatelessWidget {
  final int completedHabits;
  final int totalHabits;
  final int bestStreak;

  const DailyProgressCard({
    super.key,
    required this.completedHabits,
    required this.totalHabits,
    this.bestStreak = 15,
  });

  // Calculate progress ratio between 0.0 and 1.0
  double get progressRatio {
    if (totalHabits == 0) return 0.0;
    return (completedHabits / totalHabits).clamp(0.0, 1.0);
  }

  // Calculate percentage integer (e.g. 62)
  int get percentage => (progressRatio * 100).round();

    @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // 1. Explicit proportional height matching the mockup
      height: 135,//card height
      padding: const EdgeInsets.fromLTRB(18,16,18,16),
      decoration: BoxDecoration(
        // Soft peach background gradient matching the mockup
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFF2EA),
            Color(0xFFFFE6D9),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ------------------------------------------------------------------
          // LEFT SIDE: TEXTS & STREAK (DISTRIBUTED TOP & BOTTOM)
          // ------------------------------------------------------------------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Distributes the top title and the bottom streak across the 148px height!
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top group: Title + Dynamic Count
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Daily Progress',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8A817C),
                      ),
                    ),
                    const SizedBox(height: 11),
                    Text(
                      '$completedHabits/$totalHabits completed',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 0, 0, 0),
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),

                // Bottom group: Flame + Streak (Sitting comfortably low)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      CupertinoIcons.flame,
                      size: 18,
                      color: Color.fromARGB(255, 245, 135, 32),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Best streak: $bestStreak days',
                      style: const TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF5A524C),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ------------------------------------------------------------------
          // RIGHT SIDE: DYNAMIC GRADIENT CIRCLE
          // ------------------------------------------------------------------
          SizedBox(
            width: 94,
            height: 94,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(94, 94),
                  painter: GradientProgressPainter(progress: progressRatio),
                ),
                Text(
                  '$percentage%',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 0, 0, 0),
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

//// Custom painter that paints the active arc blending smoothly from light orange at the top to dark coral at the end
class GradientProgressPainter extends CustomPainter {
  final double progress;

  GradientProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const double strokeWidth = 5.5; // Slim, elegant stroke
    final double radius = (size.width - strokeWidth) / 2;

    // ------------------------------------------------------------------------
    // 1. BACKGROUND TRACK (Soft cream ring)
    // ------------------------------------------------------------------------
    final backgroundPaint = Paint()
      ..color = const Color(0xFFEBE0D5).withOpacity(0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    if (progress <= 0) return;

    // ------------------------------------------------------------------------
    // 2. ACTIVE PROGRESS ARC (Light Orange at Top -> Dark Coral at Tip)
    // ------------------------------------------------------------------------
    const double startAngle = -math.pi / 2; // Exactly at 12 o'clock (top)
    final double sweepAngle = 2 * math.pi * progress;

    // Exact color palette from the reference mockup:
    const Color startColor = Color(0xFFFFB27D); // Light peach-orange at the top
    const Color endColor = Color(0xFFFF6252);   // Dark vibrant coral at the end

    const int totalSegments = 120;
    final int activeSegments = (totalSegments * progress).clamp(1, totalSegments).toInt();

    for (int i = 0; i < activeSegments; i++) {
      final double t1 = i / totalSegments;
      final double t2 = (i + 1) / totalSegments;

      final double actualT2 = t2 > progress ? progress : t2;

      final double segmentStart = startAngle + (2 * math.pi * t1);
      final double segmentSweep = 2 * math.pi * (actualT2 - t1);

      // Interpolates smoothly along the progress curve (0.0 at top -> 1.0 at tip)
      final double ratio = (t1 / progress).clamp(0.0, 1.0);
      final Color segmentColor = Color.lerp(startColor, endColor, ratio)!;

      final Paint progressPaint = Paint()
        ..color = segmentColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = (i == 0 || i == activeSegments - 1)
            ? StrokeCap.round
            : StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        segmentStart,
        segmentSweep + 0.015, // Slight overlap to prevent anti-aliasing gaps
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant GradientProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
