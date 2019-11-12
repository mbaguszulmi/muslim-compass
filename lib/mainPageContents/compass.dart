import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';

class Compass extends StatefulWidget {

  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  double _directionDeg;

  @override
  void initState() {
    FlutterCompass.events.listen((double direction) {
      setState(() {
        _directionDeg = direction;
        print('Current Deg: $direction');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: -((_directionDeg ?? 0) * (math.pi / 180)),
                child: SvgPicture.asset(
                  'assets/icons/Compass.svg',
                  semanticsLabel: 'Compass',
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}