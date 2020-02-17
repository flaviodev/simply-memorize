import 'package:flutter/material.dart';
import 'dart:math' as math;

class CountdownWidget extends AnimatedWidget {
  final TickerProviderStateMixin tricker;
  final AnimationController controller;
  final Function onCompleted;

  CountdownWidget({Key key, this.tricker, this.controller, this.onCompleted})
      : super(
            key: key,
            listenable:
                StepTween(begin: controller.duration.inSeconds + 1, end: 1)
                    .animate(controller)) {
    final animation = listenable as Animation;
    animation.addStatusListener((state) => {
          if (state == AnimationStatus.completed)
            Function.apply(onCompleted, [])
        });
  }

  String get timerString {
    Duration duration = controller.duration *
        ((controller.duration.inSeconds -
                controller.value * controller.duration.inSeconds) /
            controller.duration.inSeconds);
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          timerString,
          style: TextStyle(
              fontSize: 30.0,
              color: controller.value < 0.7 ? Colors.black : Colors.red),
        ),
        Container(
            padding: EdgeInsets.all(6.0),
            height: 35,
            width: 35,
            child: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return CustomPaint(
                    painter: TimerPainter(
                  animation: controller,
                  backgroundColor: Colors.white,
                  color: controller.value < 0.7
                      ? Theme.of(context).primaryColor
                      : Colors.red,
                ));
              },
            )),
      ],
    );
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
