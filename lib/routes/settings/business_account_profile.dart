import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

import '../discover/vendor_store.dart';
import '../document_upload/upload_valid_ids.dart';
import 'components/biz_profile_location_and_social_section.dart';
import 'components/edit_profile_button.dart';
import 'components/user_profile_image_item.dart';
import 'edit_user_profile_screen.dart';

class BusinessAccountProfile extends StatelessWidget {
  const BusinessAccountProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imagesPaths = [
      R.png.storeImageTwo.imgPng,
      R.png.storeImageTwo.imgPng,
      R.png.storeImageTwo.imgPng,
      R.png.storeImageThree.imgPng,
    ];

    return Scaffold(
        appBar: const CustomAppBar(),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
                      const SliverToBoxAdapter(
                        child: BizProfileLocationAndSocialSection(),
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
                      context.loc.products,
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
                        itemBuilder: (_, index) {
                          if (index == 0) {
                            return DashedRect(
                              fChild: Icon(
                                Icons.add_circle_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 64,
                              ),
                            ).clickable(() {
                              print('Add new product');
                            });
                          }
                          return BizUploadedProductItem(
                              imagesPath: imagesPaths[index]);
                        }),
                  ),
                ],
              ),
            )));
  }
}

class BizUploadedProductItem extends StatefulWidget {
  const BizUploadedProductItem({
    super.key,
    required this.imagesPath,
  });

  final String imagesPath;

  @override
  State<BizUploadedProductItem> createState() => _BizUploadedProductItemState();
}

class _BizUploadedProductItemState extends State<BizUploadedProductItem> {
  bool showActionButtons = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: Corners.s5Border,
            child: Image.asset(widget.imagesPath)),
        Positioned(
            right: 10,
            top: 10,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.transparent.withOpacity(0.1),
              child: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
                size: 25,
              ),
            ).rippleClick(() {
              debugPrint('more option to uploaded item');

              showActionButtons = !showActionButtons;
              setState(() {});
            })),
        Positioned(
            top: 10,
            child: Visibility(
              visible: showActionButtons,
              child: Column(
                children: [
                  const VSpace(20),
                  Transform.scale(
                    scale: 0.7,
                    child: ColorBox(
                        onTap: () {
                          debugPrint('editing uploaded product');
                          showActionButtons = !showActionButtons;
                          setState(() {});
                        },
                        color: const Color(0xFFE2EDF9),
                        colorOpacity: .9,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                            const HSpace(5),
                            Text(context.loc.editProduct,
                                style: TextStyles.body1.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 13))
                          ],
                        )),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: ColorBox(
                        onTap: () {
                          debugPrint('removing uploaded product');

                          showActionButtons = !showActionButtons;
                          setState(() {});
                        },
                        color: const Color(0xFFE2EDF9),
                        colorOpacity: .9,
                        child: Row(
                          children: [
                            Icon(
                              Icons.remove_circle_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                            const HSpace(5),
                            Text(context.loc.deleteProduct,
                                style: TextStyles.body1.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 13))
                          ],
                        )),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
