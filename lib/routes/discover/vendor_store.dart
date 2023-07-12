import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

class VendorStore extends StatelessWidget {
  const VendorStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    bool isStoreVerified = true;

    List<String> imagesPaths = [
      R.png.storeImageOne.imgPng,
      R.png.storeImageTwo.imgPng,
      R.png.storeImageThree.imgPng,
    ];
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Column(children: [
          Stack(children: [
            CircleAvatar(
              radius: context.sp(40),
            ),
            Positioned(
              right: 3,
              bottom: 5,
              child: CircleAvatar(
                backgroundColor: theme.greenButton,
                radius: context.sp(10),
              ),
            )
          ]),
          const VSpace(44),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Kicks Store',
              style: TextStyles.h5.copyWith(fontWeight: FontWeight.w700),
            ),
            const HSpace(5),
            SizedBox(
                height: 25,
                width: 25,
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
          const VSpace(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(child: SvgPicture.asset(R.png.location.imgPng)),
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
                        fontWeight: FontWeight.w700, color: theme.primary),
                  ),
                ],
              ),
              CustomContainer(
                width: 4,
                height: 20,
                color: theme.greyWeakTwo,
              ),
              Column(
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
                    ),
                  ),
                ],
              )
            ],
          ),
          const VSpace(15),
          Wrap(
            children: [
              SocialMediaItem(
                mediaHandleName: context.loc.instagram,
                iconPath: R.png.instagram,
                bgColor: const Color(0xffFFD6F4),
              ),
              SocialMediaItem(
                mediaHandleName: context.loc.twitter,
                iconPath: R.png.twitter,
                bgColor: const Color(0xffCCE4FF),
              ),
              SocialMediaItem(
                mediaHandleName: context.loc.linkedIn,
                iconPath: R.png.linkedIn,
                bgColor: const Color(0xff6097EB).withOpacity(0.19),
              ),
            ],
          ),
          const VSpace(15),
          Wrap(
            children: [
              SocialMediaItem(
                mediaHandleName: context.loc.facebook,
                iconPath: R.png.facebook,
                bgColor: const Color(0xffC3D9FB),
              ),
              SocialMediaItem(
                mediaHandleName: context.loc.ticTok,
                iconPath: R.png.tiktok,
                bgColor: const Color(0xffFFF3E8),
              ),
              SocialMediaItem(
                mediaHandleName: context.loc.whatsApp,
                iconPath: R.png.whatsapp,
                bgColor: const Color(0xffD2FFE2),
              ),
            ],
          ),
          const VSpace(25),
          Text(
            context.loc.productInfo,
            style: TextStyles.body1.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const VSpace(15),
          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio: 0.7),
                  itemBuilder: (_, index) => ClipRRect(
                      borderRadius: Corners.s5Border,
                      child: Image.asset(imagesPaths[index]))))
        ]));
  }
}

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem({
    super.key,
    required this.mediaHandleName,
    required this.iconPath,
    required this.bgColor,
  });

  final String mediaHandleName;
  final String iconPath;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Padding(
      padding: const EdgeInsets.only(right: 9.0),
      child: Material(
        color: bgColor,
        borderRadius: Corners.s10Border,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
          child: Row(
            children: [
              SizedBox(child: SvgPicture.asset(iconPath)),
              const HSpace(3),
              Text(
                mediaHandleName,
                style: TextStyles.body1.copyWith(
                    fontWeight: FontWeight.w500, color: theme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
