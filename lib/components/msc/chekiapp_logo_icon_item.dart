import 'package:flutter/cupertino.dart';
import 'package:chekinapp/export.dart';

class LogoIconItem extends StatelessWidget {
  const LogoIconItem({super.key, this.allRoundPadding = 15, this.iconUrl});
  final double allRoundPadding;

  final String? iconUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(allRoundPadding),
      child: Image.asset(
        iconUrl ?? R.png.appLogoGrey.imgPng, //
      ),
    );
  }
}
