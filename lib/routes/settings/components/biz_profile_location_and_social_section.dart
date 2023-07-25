import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/settings/components/user_profile_image_item.dart';
import 'package:flutter/material.dart';

import '../../discover/vendor_store.dart';
import '../edit_user_profile_screen.dart';
import 'edit_profile_button.dart';

class BizProfileLocationAndSocialSection extends StatelessWidget {
  const BizProfileLocationAndSocialSection({
    super.key,
  });

  final bool isStoreVerified = true;

  @override
  Widget build(BuildContext context) {
    List socialMedia = [
      SocialMediaItem(
        mediaHandleName: context.loc.instagram,
        iconPath: R.png.instagram.svg,
        bgColor: const Color(0xffFFD6F4),
      ),
      SocialMediaItem(
        mediaHandleName: context.loc.twitter,
        iconPath: R.png.twitter.svg,
        bgColor: const Color(0xffCCE4FF),
      ),
      SocialMediaItem(
        mediaHandleName: context.loc.linkedIn,
        iconPath: R.png.linkedIn.svg,
        bgColor: const Color(0xff6097EB).withOpacity(0.19),
      ),
      SocialMediaItem(
        mediaHandleName: context.loc.facebook,
        iconPath: R.png.facebook.svg,
        bgColor: const Color(0xffC3D9FB),
      ),
      SocialMediaItem(
        mediaHandleName: context.loc.ticTok,
        iconPath: R.png.tiktok.svg,
        bgColor: const Color(0xffFFF3E8),
      ),
      SocialMediaItem(
        mediaHandleName: context.loc.whatsApp,
        iconPath: R.png.whatsapp.svg,
        bgColor: const Color(0xffD2FFE2),
      ),
    ];
    AppTheme theme = context.watch();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.l),
      child: SingleChildScrollView(
        child: Column(children: [
          const UserProfileImageItem(),
          const VSpace(44),
          Wrap(crossAxisAlignment: WrapCrossAlignment.end, children: [
            Text(
              'Kicks Store',
              style: TextStyles.h5.copyWith(fontWeight: FontWeight.w700),
            ),
            const HSpace(2),
            SizedBox(
                // height: 25,
                // width: 25,
                child: Image.asset(R.png.verified.imgPng)),
          ]),
          const VSpace(3),
          Material(
            color: theme.greenButton,
            borderRadius: Corners.s10Border,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
              child: Text(
                isStoreVerified ? context.loc.verified : '',
                style: TextStyles.body3
                    .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
          const VSpace(4),
          EditProfileButton(onPressed: () {
            context.push(const EditUserProfileScreen());
          }),
          const VSpace(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(child: SvgPicture.asset(R.png.location.svg)),
                      const HSpace(5),
                      Text(
                        "location",
                        style: TextStyles.body1.copyWith(
                            fontWeight: FontWeight.w500, color: theme.primary),
                      ),
                    ],
                  ),
                  const VSpace(4),
                  Text(
                    'Lagos',
                    style: TextStyles.h6.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff130F26)),
                  ),
                ],
              ),
              CustomContainer(
                width: 0.8,
                height: 20,
                color: theme.greyWeakTwo,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "luxCode",
                    style: TextStyles.body1
                        .copyWith(fontSize: 13, color: theme.primary),
                  ),
                  const VSpace(4),
                  Text(
                    'Lux-330458',
                    style: TextStyles.h6.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff130F26)),
                  ),
                ],
              ),
            ],
          ),
          const VSpace(15),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 100,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Wrap(
                runSpacing: 10,
                children: List.generate(socialMedia.length + 1, (index) {
                  if (socialMedia.length == index) {
                    return SocialMediaItem(
                      onItemTap: () {
                        // print('sss');
                      },
                      mediaHandleName: context.loc.addSocial,
                      iconPath: R.png.addSquareFill.svg,
                      bgColor: const Color(0xff6097EB).withOpacity(0.3),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                    );
                  }
                  return socialMedia[index];
                }),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
