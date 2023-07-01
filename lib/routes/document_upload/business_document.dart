import 'package:chekinapp/routes/document_upload/upload_valid_ids.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

class BusinessDocumentScreen extends StatefulWidget {
  const BusinessDocumentScreen({Key? key}) : super(key: key);

  @override
  State<BusinessDocumentScreen> createState() => _BusinessDocumentScreenState();
}

class _BusinessDocumentScreenState extends State<BusinessDocumentScreen> {
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
                  context.loc.validBusinessDoc,
                  style: TextStyles.h7.weight(FontWeight.bold),
                ),
                const VSpace(5),
                Text(
                  context.loc.pickAnyBusinessDoc,
                  style: TextStyles.body1,
                ),
                const VSpace(34),
                CustomBottomSheetSelector(
                  heightFraction: 0.3,
                  onSelectItem: (item) {
                    // print(item);
                  },
                  items: [
                    'Utility bill(Proof of address)',
                    'C.A.C Documents',
                  ],
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
                              height: 114,
                              width: 114,
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
                UploadIndicator(
                  uploadValue: 0.4,
                  status: 'Completed',
                ),
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
