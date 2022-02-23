// ignore_for_file: cascade_invocations

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class Compass extends StatefulWidget {
  const Compass({Key? key}) : super(key: key);

  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  double _heading = 0;

  String get _readout => '${_heading.toStringAsFixed(0)}°';

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen(_onData);
  }

  void _onData(CompassEvent x) => setState(() {
        _heading = x.heading!;
      });

  final TextStyle _style = const TextStyle(
    color: Colors.black,
    fontSize: 8,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CompassPainter(angle: _heading),
      child: Center(
        child: AutoSizeText(_readout, style: _style),
      ),
    );
  }
}

class CompassPainter extends CustomPainter {
  CompassPainter({required this.angle}) : super();

  final double angle;
  double get rotation => -2 * pi * (angle / 360);

  Paint get _brush => Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint circle = _brush..color = Colors.orange;

    final Paint needle = _brush
      ..color = Colors.red
      ..strokeWidth = 2;

    late final bearingIndicatorPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 4.0
      ..blendMode = BlendMode.difference;

    final double radius = min(size.width / 2, size.height / 2);
    final Offset center = Offset(size.width / 2, size.height / 2);
    final Offset? start = Offset.lerp(Offset(center.dx, radius), center, .4);
    final Offset end = Offset(size.height, radius);

    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotation);
    canvas.translate(-center.dx, -center.dy);
    canvas.drawLine(center, end, needle);
    canvas.drawCircle(center, radius, circle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// class CompassView extends StatefulWidget {
//   const CompassView({
//     Key? key,
//     required this.bearing,
//     required this.heading,
//     this.foregroundColor = Colors.white,
//     this.bearingColor = Colors.red,
//   }) : super(key: key);

//   final double? bearing;

//   final double heading;

//   final Color foregroundColor;

//   final Color bearingColor;

//   @override
//   _CompassViewState createState() => _CompassViewState();
// }

// class _CompassViewState extends State<CompassView> {
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Rose Painter
//           RepaintBoundary(
//             child: CustomPaint(
//               painter: _CompassViewPainter(
//                 heading: widget.heading,
//                 foregroundColor: widget.foregroundColor,
//               ),
//             ),
//           ),

//           // Bearing Indicator
//           if (widget.bearing != null)
//             Padding(
//               padding: const EdgeInsets.all(35),
//               child: Transform.rotate(
//                 angle: (widget.bearing! - widget.heading).toRadians(),
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: Icon(
//                     CupertinoIcons.arrowtriangle_up_fill,
//                     color: widget.bearingColor,
//                     size: 20,
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class _CompassViewPainter extends CustomPainter {
//   _CompassViewPainter({
//     required this.heading,
//     required this.foregroundColor,
//     this.majorTickCount = 12,
//     this.minorTickCount = 180,
//     this.cardinalities = const {0: 'N', 90: 'E', 180: 'S', 270: 'W'},
//   });

//   final double heading;

//   final Color foregroundColor;

//   final int majorTickCount;

//   final int minorTickCount;

//   final CardinalityMap cardinalities;

//   late final bearingIndicatorPaint = Paint()
//     ..style = PaintingStyle.stroke
//     ..color = foregroundColor
//     ..strokeWidth = 4.0
//     ..blendMode = BlendMode.difference;

//   late final majorScalePaint = Paint()
//     ..style = PaintingStyle.stroke
//     ..color = foregroundColor
//     ..strokeWidth = 2.0;

//   late final minorScalePaint = Paint()
//     ..style = PaintingStyle.stroke
//     ..color = foregroundColor.withOpacity(0.7)
//     ..strokeWidth = 1.0;

//   late final majorScaleStyle = TextStyle(
//     color: foregroundColor,
//     fontSize: 15,
//   );

//   late final cardinalityStyle = TextStyle(
//     color: foregroundColor,
//     fontSize: 32,
//   );

//   late final _majorTicks = _layoutScale(majorTickCount);
//   late final _minorTicks = _layoutScale(minorTickCount);

//   @override
//   void paint(Canvas canvas, Size size) {
//     assert(size.width == size.height, 'Size must be square');
//     const origin = Offset.zero;
//     final center = size.center(origin);
//     final radius = size.width / 2;

//     const tickPadding = 55.0;
//     const tickLength = 20.0;

//     // paint major scale
//     for (final angle in _majorTicks) {
//       final tickStart = Offset.fromDirection(
//         _correctedAngle(angle).toRadians(),
//         radius - tickPadding,
//       );

//       final tickEnd = Offset.fromDirection(
//         _correctedAngle(angle).toRadians(),
//         radius - tickPadding - tickLength,
//       );

//       canvas.drawLine(
//         center + tickStart,
//         center + tickEnd,
//         majorScalePaint,
//       );
//     }

//     // paint minor scale
//     for (final angle in _minorTicks) {
//       final tickStart = Offset.fromDirection(
//         _correctedAngle(angle).toRadians(),
//         radius - tickPadding,
//       );

//       final tickEnd = Offset.fromDirection(
//         _correctedAngle(angle).toRadians(),
//         radius - tickPadding - tickLength,
//       );

//       canvas.drawLine(
//         center + tickStart,
//         center + tickEnd,
//         minorScalePaint,
//       );
//     }

//     // paint bearing indicator
//     final tickStart = Offset.fromDirection(
//       -90.toRadians(),
//       radius,
//     );

//     final tickEnd = Offset.fromDirection(
//       -90.toRadians(),
//       radius - tickPadding - tickLength,
//     );

//     canvas.drawLine(
//       center + tickStart,
//       center + tickEnd,
//       bearingIndicatorPaint,
//     );

//     // paint major scale text
//     for (final angle in _majorTicks) {
//       const majorScaleTextPadding = 20.0;

//       final textPainter = TextSpan(
//         text: angle.toStringAsFixed(0),
//         style: majorScaleStyle,
//       ).toPainter()
//         ..layout();

//       final layoutOffset = Offset.fromDirection(
//         _correctedAngle(angle).toRadians(),
//         radius - majorScaleTextPadding,
//       );

//       final offset = center + layoutOffset - textPainter.center;
//       textPainter.paint(canvas, offset);
//     }

//     // paint cardinality text
//     for (final cardinality in cardinalities.entries) {
//       const majorScaleTextPadding = 100.0;

//       final angle = cardinality.key.toDouble();
//       final text = cardinality.value;

//       final textPainter = TextSpan(
//         text: text,
//         style: cardinalityStyle,
//       ).toPainter()
//         ..layout();

//       final layoutOffset = Offset.fromDirection(
//         _correctedAngle(angle).toRadians(),
//         radius - majorScaleTextPadding,
//       );

//       final offset = center + layoutOffset - textPainter.center;
//       textPainter.paint(canvas, offset);
//     }
//   }

//   @override
//   bool shouldRepaint(_CompassViewPainter oldDelegate) =>
//       oldDelegate.heading != heading ||
//       oldDelegate.foregroundColor != foregroundColor ||
//       oldDelegate.majorTickCount != majorTickCount ||
//       oldDelegate.minorTickCount != minorTickCount;

//   List<double> _layoutScale(int ticks) {
//     final scale = 360 / ticks;
//     return List.generate(ticks, (i) => i * scale);
//   }

//   double _correctedAngle(double angle) => angle - heading - 90;
// }

// typedef CardinalityMap = Map<num, String>;

// extension on TextPainter {
//   Offset get center => size.center(Offset.zero);
// }

// extension on TextSpan {
//   TextPainter toPainter({TextDirection textDirection = TextDirection.ltr}) =>
//       TextPainter(text: this, textDirection: textDirection);
// }

// extension on num {
//   double toRadians() => this * pi / 180;
// }

// class CompasView extends StatefulWidget {
//   const CompasView({Key? key}) : super(key: key);

//   @override
//   State<CompasView> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<CompasView> {
//   double? _bearing;

//   void _setBearing(double heading) {
//     setState(() {
//       _bearing = heading;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<CompassEvent>(
//       stream: FlutterCompass.events,
//       builder: (context, snapshot) {
//         final heading = snapshot.data?.heading ?? 0;

//         return AnnotatedRegion<SystemUiOverlayStyle>(
//           value: const SystemUiOverlayStyle(
//             statusBarColor: Colors.transparent,
//             statusBarBrightness: Brightness.dark,
//             statusBarIconBrightness: Brightness.light,
//             systemNavigationBarColor: Colors.black,
//             systemNavigationBarIconBrightness: Brightness.light,
//             // systemNavigationBarContrastEnforced: false,
//             systemNavigationBarDividerColor: Colors.black,
//           ),
//           child: MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               brightness: Brightness.dark,
//             ),
//             home: Scaffold(
//               backgroundColor: Colors.black,
//               body: Align(
//                 alignment: const Alignment(0, -0.2),
//                 child: CompassView(
//                   bearing: _bearing,
//                   heading: heading,
//                 ),
//               ),
//               floatingActionButton: FloatingActionButton(
//                 onPressed: () => _setBearing(heading),
//                 tooltip: 'Set Bearing',
//                 child: IconlyIcon(
//                   path: IconlyCurved.ArrowUp2,
//                   color: Theme.of(context).primaryColor,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
