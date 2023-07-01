import 'package:chekinapp/routes/document_upload/upload_social_media_screenshots.dart';
import 'package:chekinapp/routes/document_upload/upload_valid_ids.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import 'business_document.dart';

class UploadDocumentMainScreen extends StatelessWidget {
  const UploadDocumentMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    int pageIndex = 2;
    return Scaffold(
        appBar: CustomAppBar(
          leading: true,
          titleWidget: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 30),
            child: const LogoIconItem(allRoundPadding: 1),
          ),
          trailing: [
            UnconstrainedBox(
              child: CustomContainer(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(5),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: theme.primary,
                ),
                child: CircleAvatar(
                  backgroundColor: theme.black,
                  child: const Icon(
                    Icons.question_mark_rounded,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
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
                children: [
                  UploadValidIDsScreen(),
                  BusinessDocumentScreen(),
                  UploadSocialMediaScreenShotScreen()
                ],
              ),
            ],
          ),
        ));
  }
}
