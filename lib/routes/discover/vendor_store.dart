import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

class VendorStore extends StatefulWidget {
  const VendorStore({Key? key}) : super(key: key);

  @override
  State<VendorStore> createState() => _VendorStoreState();
}

class _VendorStoreState extends State<VendorStore> {
  // final _scrollController = ScrollController();
  // final _mainController = ScrollController();
  @override
  void initState() {
    super.initState();

    // _scrollController.addListener(() {
    //   //atEdge tells if you have scrolled to the top most or to the last item at the bottom.
    //   if (_scrollController.position.atEdge) {
    //     // this part can only fire if only it has scrolled to the last item at the top or scrolled to the last item at the bottom
    //
    //     bool isTop = _scrollController.position.pixels ==
    //         0; //so it is easy to determine when it has scrolled to the last item at the top [cause the last item at the top is always having a 0 pixels] compared to try to determine last item at the bottom
    //     ///so if not 0 which is at the top it definitely going to be last item(or pixels at the bottom since this methods only fires when it reaches the edge of the scrolling widget
    //     // let write write the code base on my explanation
    //     if (isTop) {
    //       _mainController.animateTo(_mainController.position.minScrollExtent,
    //           duration: Duration(milliseconds: 20), curve: Curves.easeOut);
    //       print('at top or do your logic to be fired here ');
    //     } else {
    //       _mainController.jumpTo(
    //         _mainController.position.maxScrollExtent,
    //       );
    //
    //       print('at bottom or do your logic to be fired here ');
    //     }
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    // _scrollController.dispose();
    // _mainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    bool isStoreVerified = true;

    List<String> imagesPaths = [
      R.png.storeImageTwo.imgPng,
      R.png.storeImageTwo.imgPng,
      R.png.storeImageTwo.imgPng,
      R.png.storeImageThree.imgPng,
    ];
    return Scaffold(
        appBar: const CustomAppBar(),
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                    bool innerBoxIsScrolled) =>
                [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Insets.l),
                      child: SingleChildScrollView(
                        child: Column(children: [
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
                          Wrap(
                              crossAxisAlignment: WrapCrossAlignment.end,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Kicks Store',
                                  style: TextStyles.h5
                                      .copyWith(fontWeight: FontWeight.w700),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 3),
                              child: Text(
                                isStoreVerified ? context.loc.verified : '',
                                style: TextStyles.body3.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const VSpace(32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: SvgPicture.asset(
                                              R.png.location.svg)),
                                      const HSpace(5),
                                      Text(
                                        "location",
                                        style: TextStyles.body1.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: theme.primary),
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
                                    style: TextStyles.body1.copyWith(
                                        fontSize: 13, color: theme.primary),
                                  ),
                                  const VSpace(4),
                                  Text(
                                    'Lux-330458',
                                    style: TextStyles.h6.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff130F26)),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const VSpace(15),
                          Wrap(
                            direction: Axis.horizontal,
                            children: [
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
                                bgColor:
                                    const Color(0xff6097EB).withOpacity(0.19),
                              ),
                            ],
                          ),
                          const VSpace(15),
                          Wrap(
                            children: [
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
                            ],
                          ),
                        ]),
                      ),
                    ),
                  )
                ],
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.l),
              child: Column(
                children: [
                  const VSpace(25),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      context.loc.productInfo,
                      style: TextStyles.body1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const VSpace(10),
                  Expanded(
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: imagesPaths.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 6,
                                childAspectRatio: 1),
                        itemBuilder: (_, index) => ClipRRect(
                            borderRadius: Corners.s5Border,
                            child: Image.asset(imagesPaths[index]))),
                  ),
                ],
              ),
            )));
  }
}

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem({
    super.key,
    required this.mediaHandleName,
    required this.iconPath,
    required this.bgColor,
    this.padding,
    this.onItemTap,
  });

  final String mediaHandleName;
  final String iconPath;
  final Color bgColor;
  final EdgeInsets? padding;
  final Function()? onItemTap;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 9.0),
        child: Material(
          color: bgColor,
          borderRadius: Corners.s10Border,
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
            child: Row(
              children: [
                SizedBox(
                    height: 15.0, width: 15, child: SvgPicture.asset(iconPath)),
                const HSpace(3),
                Text(
                  mediaHandleName,
                  style: TextStyles.body1.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ).clickable(onItemTap),
      ),
    );
  }
}
