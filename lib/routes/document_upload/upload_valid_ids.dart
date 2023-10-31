import 'package:chekinapp/core/commands/business_command.dart';
import 'package:chekinapp/core/providers/business_provider.dart';
import 'package:chekinapp/routes/document_upload/upload_document_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import 'dart:math' as math;

import '../../utils/imagepicker/image_picker_choice.dart';
import '../../utils/imagepicker/provider/image_provider.dart';
import 'components/bottomsheet_selector.dart';
import 'components/upload_indicator.dart';

class UploadValidIDsScreen extends StatefulWidget {
  const UploadValidIDsScreen({Key? key}) : super(key: key);

  @override
  State<UploadValidIDsScreen> createState() => _UploadValidIDsScreenState();
}

class _UploadValidIDsScreenState extends State<UploadValidIDsScreen> {
  String documentType = '';
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    //the image path selected
    String image = context.select((ImageProviders provider) => provider.image);
    BusinessProvider business = context.watch<BusinessProvider>();
    int pageIndex = context
        .select((UploadProvider provider) => provider.currentUploadIndex);
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
                CustomBottomSheetSelector(
                  heightFraction: 0.3,
                  onSelectItem: (item) {
                    documentType = item;
                  },
                  items: [
                    'Voters card',
                    'International Passport',
                    'Drivers License',
                    'National Id Number Slip'
                  ],
                ),
                const VSpace(34),
                const DocumentPickerItem(),
                const VSpace(30),
                const UploadIndicatorItem(),
              ],
            ),

            ///for the button
            Container(
              padding: const EdgeInsets.only(
                bottom: 20.0,
              ),
              child: PrimaryButton(
                onPressed: () async {
                  if (image != '' &&
                      business.uploadStatus != UploadStatus.completed &&
                      documentType != '') {
                    await BusinessCommand(context).updateBusinessDocument(
                      'idUpload',
                      image,
                    );
                  } else if (documentType == '') {
                    DialogServices.messageModalFromTop(context,
                        message:
                            'Please select the type of document to upload first',
                        notificationType: NotificationType.error);
                  } else {
                    context.read<UploadProvider>().setCurrentUploadIndex =
                        pageIndex + 1;
                    // context.read<UploadProvider>().setCurrentUploadIndex = 1;
                    context.read<BusinessProvider>().resetUploadProgress();
                    context.read<ImageProviders>().clearSingleImagePath();
                  }
                },
                label: image != '' &&
                        business.uploadStatus != UploadStatus.completed
                    ? context.loc.upload
                    : context.loc.conti,
                radius: 20,
                fullWidth: true,
                loading: business.isBusy,
                color: business.isBusy ? theme.primary : Colors.transparent,
                textColor: business.isBusy ? Colors.white : theme.black,
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

class DocumentPickerItem extends StatelessWidget {
  const DocumentPickerItem(
      {super.key, this.textTitle, this.useOnlyCamera = false});

  final String? textTitle;
  final bool useOnlyCamera;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    //the image path selected
    String image = context.select((ImageProviders provider) => provider.image);
    BusinessProvider business = context.watch<BusinessProvider>();

    return Align(
      alignment: Alignment.center,
      child: DashedRect(
        color: theme.primary,
        fChild: SizedBox(
            height: 240,
            width: context.sp(335),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: image != ''
                  ? Center(
                      child: Stack(
                        children: [
                          Image.file(
                            File(image),
                          ),
                          Positioned(
                            right: 0,
                            child: CustomContainer(
                              height: 35.0,
                              width: 35.0,
                              borderRadius: Corners.s5Border,
                              color: Colors.grey.withOpacity(0.5),
                              child: Icon(
                                Icons.close_rounded,
                                color: theme.redButton,
                              ),
                            ).clickable(() {
                              context
                                  .read<ImageProviders>()
                                  .clearSingleImagePath();
                              context
                                  .read<BusinessProvider>()
                                  .resetUploadProgress();
                            }),
                          )
                        ],
                      ),
                    )
                  : business.uploadStatus == UploadStatus.completed
                      ? UnconstrainedBox(
                          child: CustomContainer(
                            color: theme.greenButton,
                            height: context.sp(160),
                            width: context.sp(210),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: Icon(
                                      Icons.check_circle,
                                      size: 75.0,
                                      color: Colors.white,
                                    )),

                                ///
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      context.loc.completed,
                                      style: TextStyles.body1.copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 114,
                                width: 114,
                                child: SvgPicture.asset(
                                  R.png.cloudUploading.svg,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  textTitle ?? context.loc.frontPlease,
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
            )),
      ).clickable(() {
        CustomBottomSheet.openBottomSheet(
            context,
            sizeFraction: 0.2,
            ImagePickerChoice(
              useOnlyCamera: useOnlyCamera,
            ));
      }),
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
