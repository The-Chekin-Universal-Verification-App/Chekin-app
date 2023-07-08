import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chekinapp/export.dart';

class Durations {
  static Duration get fastest => .15.seconds;

  static Duration get fast => .25.seconds;

  static Duration get medium => .35.seconds;

  static Duration get slow => .7.seconds;

  static Duration get midi => .10.seconds;
}

class PageBreaks {
  static double get largePhone => 550;

  static double get tabletPortrait => 768;

  static double get tabletLandscape => 1024;

  static double get desktop => 1440;
}

class Insets {
  static double gutterScale = 1;

  static double scale = 1;

  /// Dynamic insets, may get scaled with the device size
  static double get mGutter => m * gutterScale;

  static double get lGutter => l * gutterScale;

  static double get xs => 2 * scale;

  static double get sm => 6 * scale;

  static double get m => 15 * scale;

  static double get l => 24 * scale;

  static double get xl => 36 * scale;
}

class FontSizes {
  static double get scale => 1;

  static double get s10 => 10 * scale;

  static double get s12 => 12 * scale;

  static double get s14 => 14 * scale;

  static double get s16 => 16 * scale;

  static double get s18 => 18 * scale;

  static double get s20 => 20 * scale;

  static double get s24 => 24 * scale;

  static double get s34 => 34 * scale;
  static double get s28 => 28 * scale;

  static double get s48 => 48 * scale;

  static double get s60 => 60 * scale;

  static double get s96 => 96 * scale;
}

class Sizes {
  static double hitScale = 1;

  static double get hit => 40 * hitScale;

  static double get iconMed => 30;

  static double get sideBarSm => 150 * hitScale;

  static double get sideBarMed => 200 * hitScale;

  static double get sideBarLg => 290 * hitScale;

  static double get btn => 52 * hitScale;
}

class TextStyles {
  static TextStyle workSans = GoogleFonts.workSans();

  static TextStyle get t1 => workSans.regular.size(FontSizes.s16);

  static TextStyle get t2 => workSans.semiBold.size(FontSizes.s14);

  static TextStyle get h1 => workSans.bold.size(FontSizes.s96);

  static TextStyle get h2 => workSans.bold.size(FontSizes.s60);

  static TextStyle get h3 => workSans.bold.size(FontSizes.s48);

  static TextStyle get h4 => workSans.bold.size(FontSizes.s28);

  static TextStyle get h5 => workSans.bold.size(FontSizes.s24);

  static TextStyle get h6 => workSans.semiBold.size(FontSizes.s20);

  static TextStyle get h7 => workSans.semiBold.size(FontSizes.s18);

  static TextStyle get body1 => workSans.regular.size(FontSizes.s16);

  static TextStyle get body2 => workSans.regular.size(FontSizes.s14);

  static TextStyle get body3 => workSans.size(FontSizes.s12);

  static TextStyle get footnote => workSans.regular.size(FontSizes.s10);

  static TextStyle get caption => workSans.regular.size(FontSizes.s12);

  static TextStyle get button => workSans.semiBold.size(
        FontSizes.s18,
      );
}

class Shadows {
  static bool enabled = true;

  static double get mRadius => 8;

  static List<BoxShadow> m(Color color, [double? opacity = 0]) {
    return [
      BoxShadow(
        color: color.withOpacity(opacity ?? .03),
        blurRadius: mRadius,
        spreadRadius: mRadius / 2,
        offset: const Offset(1, 0),
      ),
      BoxShadow(
        color: color.withOpacity(opacity ?? .04),
        blurRadius: mRadius / 2,
        spreadRadius: mRadius / 4,
        offset: const Offset(1, 0),
      )
    ];
  }

  static List<BoxShadow> get universal => [
        BoxShadow(
          color: Colors.grey.withOpacity(.2),
          spreadRadius: 0.9,
          blurRadius: 8.5,
        ),
      ];
  static List<BoxShadow> get small => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 1)),
      ];
}

class Corners {
  static double get btn => s5;

  static double get dialog => 12;

  ///zero
  static double get s0 => 0;

  static BorderRadius get s0Border => BorderRadius.all(s0Radius);

  static Radius get s0Radius => Radius.circular(s0);

  /// Xs
  static double get s3 => 3;

  static BorderRadius get s3Border => BorderRadius.all(s3Radius);

  static Radius get s3Radius => Radius.circular(s3);

  /// Small
  static double get s5 => 5;

  static BorderRadius get s5Border => BorderRadius.all(s5Radius);

  static Radius get s5Radius => Radius.circular(s5);

  /// Medium
  static double get s8 => 8;

  static BorderRadius get s8Border => BorderRadius.all(s8Radius);

  static Radius get s8Radius => Radius.circular(s8);

  /// Large
  static double get s10 => 10;

  static BorderRadius get s10Border => BorderRadius.all(s10Radius);

  static Radius get s10Radius => Radius.circular(s10);

  ///X-Large
  static double get s12 => 12;

  static BorderRadius get s12Border => BorderRadius.all(s12Radius);
  static BorderRadius get s20Border => BorderRadius.all(s20Radius);

  static Radius get s12Radius => Radius.circular(s12);
  static Radius get s20Radius => Radius.circular(s20);

  static double get s16 => 16;
  static double get s20 => 20;

  static BorderRadius get s16Border => BorderRadius.all(s16Radius);

  static Radius get s16Radius => Radius.circular(s16);
}
