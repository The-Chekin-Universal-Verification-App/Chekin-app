import 'package:chekinapp/routes/document_upload/set_profile_picture.dart';
import 'package:chekinapp/routes/document_upload/take_selfie_with_id.dart';
import 'package:chekinapp/routes/document_upload/upload_social_media_screenshots.dart';
import 'package:chekinapp/routes/document_upload/upload_valid_ids.dart';
import 'package:chekinapp/routes/main/main.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import 'business_document.dart';

class UploadDocumentMainScreen extends StatelessWidget {
  const UploadDocumentMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UploadProvider(),
      child: _UploadDocumentMainScreen(),
    );
  }
}

class _UploadDocumentMainScreen extends StatelessWidget {
  const _UploadDocumentMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    int pageIndex = context
        .select((UploadProvider provider) => provider.currentUploadIndex);
    return Scaffold(
        appBar: CustomAppBar(
          leading: true,
          onTapLeadingIcon: () {
            if (pageIndex == 0) {
              context.pop();
            } else {
              context.read<UploadProvider>().setCurrentUploadIndex =
                  pageIndex - 1;
            }
          },
          titleWidget: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 30),
            child: const LogoIconItem(allRoundPadding: 1),
          ),
          trailing: [
            // UnconstrainedBox(
            //   child: CustomContainer(
            //     height: 30,
            //     width: 30,
            //     padding: const EdgeInsets.all(5),
            //     color: Colors.transparent,
            //     borderRadius: BorderRadius.circular(50),
            //     border: Border.all(
            //       color: theme.primary,
            //     ),
            //     child: CircleAvatar(
            //       backgroundColor: theme.black,
            //       child: const Icon(
            //         Icons.question_mark_rounded,
            //         size: 15,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),

            UnconstrainedBox(
              child: Text(
                'Skip for now',
                style: TextStyles.h6.txtColor(theme.black),
              ).clickable(() {
                DialogServices.emptyModalWithNoTitle(context,
                    autoPop: false,
                    body: Column(
                      children: [
                        Text(
                          'Note',
                          style: TextStyles.h6.txtColor(theme.black),
                        ),
                        const VSpace(20),
                        Text(
                          'Skipping this means you will be having limited privilege using the app, until you complete this verification process. You can do that from you profile page in the app.',
                          style: TextStyles.body1.txtColor(theme.black),
                        ),
                        const VSpace(15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: theme.primary,
                                      ),
                                      borderRadius: Corners.s5Border),
                                ),
                                child: Text(
                                  'Cancel',
                                  style: TextStyles.body1.bold,
                                )),
                            const HSpace(20),
                            TextButton(
                                onPressed: () {
                                  context.pushOff(const MainScreen());
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      theme.primary.withOpacity(0.9),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: Corners.s5Border),
                                ),
                                child: Text(
                                  'I know, skip',
                                  style: TextStyles.body1.bold
                                      .txtColor(Colors.white),
                                )),
                          ],
                        ),
                        const VSpace(10)
                      ],
                    ));
              }),
            ),
            const HSpace(20)
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Flexible(
                      flex: 1,
                      child: CustomContainer(
                        height: 5,
                        duration: const Duration(milliseconds: 640),
                        width: context.widthPx * 0.3,
                        color: pageIndex == index
                            ? theme.primary
                            : Colors.blueGrey[100],
                        borderRadius: BorderRadius.circular(10),
                        margin: EdgeInsets.only(right: context.sp(5)),
                      ),
                    ),
                  ),
                ),
              ),
              IndexedStack(
                index: pageIndex,
                children: const [
                  UploadValidIDsScreen(),
                  BusinessDocumentScreen(),
                  UploadSocialMediaScreenShotScreen(),
                  SelfieWithIDScreen(),
                  UploadProfilePictureScreen(),
                ],
              ),
            ],
          ),
        ));
  }
}

class UploadProvider extends BaseProvider {
  int get currentUploadIndex => _currentUploadIndex;
  int _currentUploadIndex = 0;
  set setCurrentUploadIndex(int value) {
    _currentUploadIndex = value;
    notifyListeners();
  }
}
