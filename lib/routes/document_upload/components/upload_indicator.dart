import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

import '../../../core/providers/business_provider.dart';

class UploadIndicatorItem extends StatelessWidget {
  const UploadIndicatorItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BusinessProvider business = context.watch<BusinessProvider>();

    return UploadIndicator(
      uploadValue: business.uploadProgress,
      status: business.uploadStatus,
    );
  }
}

class UploadIndicator extends StatelessWidget {
  const UploadIndicator({
    super.key,
    this.status,
    this.uploadValue = 0,
  });
  final double uploadValue;
  final UploadStatus? status;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Column(
      children: [
        ClipRRect(
          borderRadius: Corners.s8Border,
          child: LinearProgressIndicator(
            value: uploadValue,
            minHeight: 20,
            color: status == UploadStatus.failed
                ? theme.redButton
                : status == UploadStatus.completed
                    ? theme.greenButton
                    : theme.primary,
            backgroundColor: theme.greyTextFieldFill,
          ),
        ),
        const VSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${(uploadValue * 100).truncate()}%',
              style: TextStyles.body3.copyWith(
                  fontWeight: FontWeight.w500, fontSize: 14, color: theme.txt),
            ),
            Text(
              status!.name.toString().toUpperCase(),
              style: TextStyles.body3.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: uploadValue < 1
                      ? theme.txt
                      : status == UploadStatus.failed
                          ? theme.redButton
                          : theme.greenButton),
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
