import 'package:flutter/material.dart';

class ColorHelper {
  static Color shiftHsl(Color c, [double amt = 0]) {
    HSLColor hslc = HSLColor.fromColor(c);
    return hslc.withLightness((hslc.lightness + amt).clamp(0.0, 1.0)).toColor();
  }

  static Color parseHex(String value) =>
      Color(int.parse(value.substring(1, 7), radix: 16) + 0xFF000000);

  static Color blend(Color dst, Color src, double opacity) {
    return Color.fromARGB(
      255,
      (dst.red.toDouble() * (1.0 - opacity) + src.red.toDouble() * opacity)
          .toInt(),
      (dst.green.toDouble() * (1.0 - opacity) + src.green.toDouble() * opacity)
          .toInt(),
      (dst.blue.toDouble() * (1.0 - opacity) + src.blue.toDouble() * opacity)
          .toInt(),
    );
  }

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value > 0 && value <= 1);
    final hsl = HSLColor.fromColor(color);
    final darkHsl = hsl.withLightness(darker
        ? (hsl.lightness - value)
        : (hsl.lightness + value).clamp(0.0, 1.0));

    return darkHsl.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    /// create different color shades ranging from 50 .... 900
    Map<int, Color> colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color,
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true)
    };
    return MaterialColor(color.value, colorShades);
  }
}
