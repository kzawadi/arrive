// ignore_for_file: cascade_invocations

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class CompassView extends StatefulWidget {
  const CompassView({
    Key? key,
    required this.heading,
    this.foregroundColor = Colors.black,
    this.bearingColor = Colors.red,
  }) : super(key: key);

  final double heading;

  final Color foregroundColor;

  final Color bearingColor;

  @override
  _CompassViewState createState() => _CompassViewState();
}

class _CompassViewState extends State<CompassView> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: _CompassViewPainter(
              heading: widget.heading,
              foregroundColor: widget.foregroundColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Transform.rotate(
              angle: (widget.heading).toRadians(),
              child: const Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  CupertinoIcons.arrowtriangle_up_fill,
                  color: Colors.orange,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CompassViewPainter extends CustomPainter {
  _CompassViewPainter({
    required this.heading,
    required this.foregroundColor,
    this.majorTickCount = 4,
    this.minorTickCount = 180,
    this.cardinalities = const {0: 'N', 90: 'E', 180: 'S', 270: 'W'},
  });

  final double heading;

  final Color foregroundColor;

  final int majorTickCount;

  final int minorTickCount;

  final CardinalityMap cardinalities;

  late final majorScalePaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = foregroundColor
    ..strokeWidth = 2.0;

  // late final majorScaleStyle = TextStyle(
  //   color: foregroundColor,
  //   fontSize: 12,
  // );

  late final cardinalityStyle = TextStyle(
    color: foregroundColor,
    fontSize: 13,
  );

  late final _majorTicks = _layoutScale(majorTickCount);
  // late final _minorTicks = _layoutScale(minorTickCount);

  @override
  void paint(Canvas canvas, Size size) {
    assert(size.width == size.height, 'Size must be square');
    const origin = Offset.zero;
    final center = size.center(origin);
    final radius = size.width / 2;

    const tickPadding = 20.0;
    const tickLength = 20.0;

    // paint major scale
    for (final angle in _majorTicks) {
      final tickStart = Offset.fromDirection(
        _correctedAngle(angle).toRadians(),
        radius - tickPadding,
      );

      final tickEnd = Offset.fromDirection(
        _correctedAngle(angle).toRadians(),
        radius - tickPadding - tickLength,
      );

      canvas.drawLine(
        center + tickStart,
        center + tickEnd,
        majorScalePaint,
      );
    }

    // paint cardinality text
    for (final cardinality in cardinalities.entries) {
      const majorScaleTextPadding = 12.0;

      final angle = cardinality.key.toDouble();
      final text = cardinality.value;

      final textPainter = TextSpan(
        text: text,
        style: cardinalityStyle,
      ).toPainter()
        ..layout();

      final layoutOffset = Offset.fromDirection(
        _correctedAngle(angle).toRadians(),
        radius - majorScaleTextPadding,
      );

      final offset = center + layoutOffset - textPainter.center;
      textPainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(_CompassViewPainter oldDelegate) =>
      oldDelegate.heading != heading ||
      oldDelegate.foregroundColor != foregroundColor ||
      oldDelegate.majorTickCount != majorTickCount ||
      oldDelegate.minorTickCount != minorTickCount;

  List<double> _layoutScale(int ticks) {
    final scale = 360 / ticks;
    return List.generate(ticks, (i) => i * scale);
  }

  double _correctedAngle(double angle) => angle - heading - 90;
}

typedef CardinalityMap = Map<num, String>;

extension on TextPainter {
  Offset get center => size.center(Offset.zero);
}

extension on TextSpan {
  TextPainter toPainter({TextDirection textDirection = TextDirection.ltr}) =>
      TextPainter(text: this, textDirection: textDirection);
}

extension on num {
  double toRadians() => this * pi / 180;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        final heading = snapshot.data?.heading ?? 0;

        return Container(
          color: Colors.transparent,
          child: CompassView(
            // bearing: _bearing,
            heading: heading,
          ),
        );
      },
    );
  }
}
