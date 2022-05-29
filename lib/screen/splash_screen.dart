import 'package:chekin/constants/assets_path.dart';
import 'package:chekin/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(splashlogo),
            ),
          ),
        ],
      ),
    );
  }
}
