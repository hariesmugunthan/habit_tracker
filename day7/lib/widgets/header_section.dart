import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// HeaderSection displays:
/// 1. Custom settings/slider filter button on the left
/// 2. Date ("Sunday, May 3") and Title ("Today's Habits") in the middle
/// 3. User profile avatar on the right
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Settings / Filter Slider Button
          // 1. Settings / Filter Slider Button (Pixel-matched)
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0C000000), // Soft 5% shadow matching mockup
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CustomPaint(painter: SliderIconPainter()),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // 2. Date + "Today's Habits" Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sunday, May 3',
                  style: GoogleFonts.poppins(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8E8E93),
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Today's Habits",
                  style: GoogleFonts.poppins(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1C1C1E),
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
          ),

          // 3. User Profile Avatar
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile_picture_clear.png'),
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom painter for the 2-line equalizer/slider icon matching the mockup
class SliderIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const color = Color(0xFF2C2C2E);
    const double strokeW = 1.5;

    final linePaint = Paint()
      ..color = color
      ..strokeWidth = strokeW
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeW;

    // ------------------------------------------------------------------------
    // TOP SLIDER: Equal 1:1 Squircle Handle on the Left
    // ------------------------------------------------------------------------
    const double topY = 6.2;
    const double topCenterX = 7.0;

    canvas.drawLine(const Offset(2.0, topY), const Offset(18.0, topY), linePaint);

    // Balanced 5.2 x 5.2 square with rounded corners (no longer stretched!)
    final topSquircle = RRect.fromRectAndRadius(
      Rect.fromCenter(center: const Offset(topCenterX, topY), width: 5.2, height: 5.2),
      const Radius.circular(1.8),
    );
    canvas.drawRRect(topSquircle.inflate(0.5), fillPaint);
    canvas.drawRRect(topSquircle, strokePaint);

    // ------------------------------------------------------------------------
    // BOTTOM SLIDER: Equal 1:1 Squircle Handle on the Right
    // ------------------------------------------------------------------------
    const double bottomY = 13.8;
    const double bottomCenterX = 13.0;

    canvas.drawLine(const Offset(2.0, bottomY), const Offset(18.0, bottomY), linePaint);

    // Balanced 5.2 x 5.2 square with rounded corners (no longer stretched!)
    final bottomSquircle = RRect.fromRectAndRadius(
      Rect.fromCenter(center: const Offset(bottomCenterX, bottomY), width: 5.2, height: 5.2),
      const Radius.circular(1.8),
    );
    canvas.drawRRect(bottomSquircle.inflate(0.5), fillPaint);
    canvas.drawRRect(bottomSquircle, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}