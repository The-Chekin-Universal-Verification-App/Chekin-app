import 'package:chekinapp/core/providers/business_provider.dart';
import 'package:chekinapp/routes/document_upload/upload_document_main_screen.dart';
import 'package:chekinapp/routes/document_upload/upload_valid_ids.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

import '../../core/commands/business_command.dart';
import '../../utils/imagepicker/provider/image_provider.dart';
import 'components/bottomsheet_selector.dart';
import 'components/upload_indicator.dart';

class BusinessDocumentScreen extends StatefulWidget {
  const BusinessDocumentScreen({Key? key}) : super(key: key);

  @override
  State<BusinessDocumentScreen> createState() => _BusinessDocumentScreenState();
}

class _BusinessDocumentScreenState extends State<BusinessDocumentScreen> {
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
                    documentType = item;
                  },
                  items: const [
                    'Utility bill(Proof of address)',
                    'C.A.C Documents',
                  ],
                ),
                const VSpace(34),
                DocumentPickerItem(textTitle: context.loc.frontPlease),
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
                      'cacUtility',
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
                    // context.read<UploadProvider>().setCurrentUploadIndex = 2;
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
          ], //
        ),
      ),
    );
  }
}
