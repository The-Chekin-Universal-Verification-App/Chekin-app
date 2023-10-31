import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

class PreviewImage extends StatefulWidget {
  const PreviewImage(
      {Key? key, required this.imagePath, required this.isNetworkImage})
      : super(key: key);
  final bool isNetworkImage;
  final String imagePath;
  @override
  State<PreviewImage> createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      backgroundColor: theme.black,
      appBar: CustomAppBar(
        backgroundColor: theme.black,
        leadingIconColor: theme.secondary,
        leadingWidth: 80,
        onTapLeadingIcon: () {
          context.pop();
        },
        leadingIcon: SizedBox(
          child: Center(
            child: Text(
              ' Cancel',
              style: TextStyles.h5
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        trailing: [
          Text(
            'Done',
            style: TextStyles.h5
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ).rippleClick(() {
            context.pop();
          }, padding: EdgeInsets.only(left: 8, right: 8, top: 15))
        ],
      ),
      body: Center(
        child: SizedBox(
            height: context.heightPx * 0.6,
            child: widget.isNetworkImage
                ? Image.network(
                    widget.imagePath,
                    // fit: BoxFit.cover,
                  )
                : Image.file(
                    File(widget.imagePath),
                    // fit: BoxFit.cover,
                  )),
      ),
    );
  }
}
