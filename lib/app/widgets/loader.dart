import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key, this.color, this.size = 32.0}) : super(key: key);

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color ?? Theme.of(context).primaryColor,
      size: size,
    );
  }
}
