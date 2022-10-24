import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class FloatingButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  const FloatingButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 29),
            child: Container(
              width: 5,
              height: 27,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF50FDF6),
                    Color(0xFF38BAFF),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Transform.rotate(
              angle: (math.pi / 180) * 90,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 29),
                child: Container(
                  width: 5,
                  height: 27,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF50FDF6),
                        Color(0xFF38BAFF),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CustomPaint(
              painter: CurvePainter(
                  colors: const [Color(0xFF50FDF6), Color(0xFF38BAFF)],
                  angle: 140 + (360 - 140) * (1.0)),
              child: const SizedBox(
                width: 78,
                height: 78,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double? angle;
  final List<Color>? colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors ?? [];
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = SweepGradient(
      startAngle: degreeToRadians(0),
      endAngle: degreeToRadians(360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (6 / 2);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(0), degreeToRadians(360), false, paint);

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle! + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 6 / 2);

    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}
