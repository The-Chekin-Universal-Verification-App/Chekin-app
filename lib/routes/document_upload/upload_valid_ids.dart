import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import 'dart:math' as math;

class UploadValidIDsScreen extends StatefulWidget {
  const UploadValidIDsScreen({Key? key}) : super(key: key);

  @override
  State<UploadValidIDsScreen> createState() => _UploadValidIDsScreenState();
}

class _UploadValidIDsScreenState extends State<UploadValidIDsScreen> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height - 120),

        ///the 120 is the estimated appbar height and the page index indicator  taking them of allows the rest part of the screens to show up in the visible area
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.loc.documentUpload,
                      style: TextStyles.h5,
                    ),
                  ],
                ),
                const VSpace(5),
                Text(
                  context.loc.validId,
                  style: TextStyles.h7.weight(FontWeight.bold),
                ),
                const VSpace(5),
                Text(
                  context.loc.pickAnyID,
                  style: TextStyles.body1,
                ),
                const VSpace(34),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: context.sp(10)),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: theme.primary,
                      ),
                      borderRadius: Corners.s20Border),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Value Here',
                        style: TextStyles.body1,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                      )
                    ],
                  ),
                ),
                const VSpace(34),
                Align(
                  alignment: Alignment.center,
                  child: DashedRect(
                    color: theme.primary,
                    fChild: SizedBox(
                      height: 240,
                      width: context.sp(335),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: SvgPicture.asset(
                                R.png.cloudUploading.svg,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.loc.frontPlease,
                                style: TextStyles.body1
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                              Text(
                                '*',
                                style: TextStyles.h5.copyWith(
                                    height: 1.5,
                                    color: theme.redButton,
                                    fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const VSpace(30),
                UploadIndicator(),
              ],
            ),

            ///for the button
            Container(
              padding: const EdgeInsets.only(
                bottom: 20.0,
              ),
              child: PrimaryButton(
                onPressed: () {},
                label: context.loc.conti,
                radius: 20,
                fullWidth: true,
                color: Colors.transparent,
                textColor: theme.black,
                borderColor: theme.primary.withOpacity(0.48),
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
            // VSpace(20),
          ], //
        ),
      ),
    );
  }
}

class UploadIndicator extends StatelessWidget {
  const UploadIndicator({
    super.key,
  });
  final double uploadState = 0.0;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Column(
      children: [
        ClipRRect(
          borderRadius: Corners.s8Border,
          child: LinearProgressIndicator(
            value: uploadState,
            minHeight: 20,
            backgroundColor: theme.greyTextFieldFill,
          ),
        ),
        const VSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$uploadState%',
              style: TextStyles.body3.copyWith(
                  fontWeight: FontWeight.w500, fontSize: 14, color: theme.txt),
            ),
            Text(
              uploadState == 0
                  ? context.loc.upload
                  : uploadState < 1
                      ? context.loc.login
                      : uploadState == 1
                          ? context.loc.welcomeTo
                          : context.loc.upload,
              style: TextStyles.body3.copyWith(
                  fontWeight: FontWeight.w500, fontSize: 14, color: theme.txt),
            ),
            Text(
              '100%',
              style: TextStyles.body3.copyWith(
                  fontWeight: FontWeight.w500, fontSize: 14, color: theme.txt),
            ),
          ],
        ),
      ],
    );
  }
}

class DashedRect extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double gap;
  final Widget? fChild;

  const DashedRect(
      {super.key,
      this.color = Colors.black,
      this.strokeWidth = 1.0,
      this.gap = 5.0,
      this.fChild});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(strokeWidth / 2),
      child: CustomPaint(
        painter:
            DashRectPainter(color: color, strokeWidth: strokeWidth, gap: gap),
        child: fChild,
      ),
    );
  }
}

class DashRectPainter extends CustomPainter {
  double strokeWidth;
  Color color;
  double gap;

  DashRectPainter(
      {this.strokeWidth = 5.0, this.color = Colors.red, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double x = size.width;
    double y = size.height;

    Path topPath = getDashedPath(
      a: const math.Point(0, 0),
      b: math.Point(x, 0),
      gap: gap,
    );

    Path rightPath = getDashedPath(
      a: math.Point(x, 0),
      b: math.Point(x, y),
      gap: gap,
    );

    Path bottomPath = getDashedPath(
      a: math.Point(0, y),
      b: math.Point(x, y),
      gap: gap,
    );

    Path leftPath = getDashedPath(
      a: const math.Point(0, 0),
      b: math.Point(0.001, y),
      gap: gap,
    );

    canvas.drawPath(topPath, dashedPaint);
    canvas.drawPath(rightPath, dashedPaint);
    canvas.drawPath(bottomPath, dashedPaint);
    canvas.drawPath(leftPath, dashedPaint);
  }

  Path getDashedPath({
    required math.Point<double> a,
    required math.Point<double> b,
    required gap,
  }) {
    Size size = Size(b.x - a.x, b.y - a.y);
    Path path = Path();
    path.moveTo(a.x, a.y);
    bool shouldDraw = true;
    math.Point currentPoint = math.Point(a.x, a.y);

    num radians = math.atan(size.height / size.width);

    num dx = math.cos(radians) * gap < 0
        ? math.cos(radians) * gap * -1
        : math.cos(radians) * gap;

    num dy = math.sin(radians) * gap < 0
        ? math.sin(radians) * gap * -1
        : math.sin(radians) * gap;

    while (currentPoint.x <= b.x && currentPoint.y <= b.y) {
      shouldDraw
          ? path.lineTo(double.parse(currentPoint.x.toString()),
              double.parse(currentPoint.y.toString()))
          : path.moveTo(double.parse(currentPoint.x.toString()),
              double.parse(currentPoint.y.toString()));
      shouldDraw = !shouldDraw;
      currentPoint = math.Point(
        currentPoint.x + dx,
        currentPoint.y + dy,
      );
    }
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
