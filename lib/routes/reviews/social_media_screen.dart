import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/reviews/review_screen.dart';
import 'package:flutter/material.dart';

class SocialMediaHandles extends StatelessWidget {
  const SocialMediaHandles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VSpace(10),
          Text(context.loc.vendorsContact,
              style: TextStyles.h5.copyWith(fontWeight: FontWeight.w700)),
          const VSpace(30),
          SocialMedialHandleItem(
            onItemTap: () {},
            imagePath: R.png.instagram.svg,
          ),
          SocialMedialHandleItem(
            onItemTap: () {},
            imagePath: R.png.twitter.svg,
          ),
          SocialMedialHandleItem(
            onItemTap: () {},
            imagePath: R.png.facebook.svg,
          ),
          SocialMedialHandleItem(
            onItemTap: () {},
            imagePath: R.png.tiktok.svg,
          ),
          SocialMedialHandleItem(
            onItemTap: () {},
            imagePath: R.png.whatsapp.svg,
          ),
          SocialMedialHandleItem(
            onItemTap: () {},
            imagePath: R.png.linkedIn.svg,
          ),
        ],
      ),
    );
  }
}

class SocialMedialHandleItem extends StatelessWidget {
  const SocialMedialHandleItem(
      {super.key, required this.onItemTap, required this.imagePath});

  final Function() onItemTap;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SvgPicture.asset(
                      imagePath,
                    ),
                    const HSpace(10),
                    Text(context.loc.instagram,
                        style: TextStyles.h6
                            .copyWith(fontWeight: FontWeight.w500)),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: theme.greyWeakTwo,
                )
              ],
            ).clickable(onItemTap),
            const VSpace(8),
            const ChekInAppDivider(),
          ],
        ),
      ),
    );
  }
}
