import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Replace with custom loading animation
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFadingCircle(color: Colors.red),
      ),
    );
  }
}
