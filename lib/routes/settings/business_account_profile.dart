import 'package:chekinapp/core/providers/product_provider.dart';
import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

import '../../components/input/base_text_input.dart';
import '../../core/commands/product_command.dart';
import '../../utils/imagepicker/image_picker_choice.dart';
import '../../utils/imagepicker/provider/image_provider.dart';
import '../document_upload/upload_valid_ids.dart';
import 'components/biz_profile_location_and_social_section.dart';
import 'edit_uploaded_product.dart';

class BusinessAccountProfile extends StatefulWidget {
  const BusinessAccountProfile({Key? key}) : super(key: key);

  @override
  State<BusinessAccountProfile> createState() => _BusinessAccountProfileState();
}

class _BusinessAccountProfileState extends State<BusinessAccountProfile> {
  int productVewIndex = 0;
  late int currentIndex;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    //the image path selected
    ProductProvider productProvider = context.watch<ProductProvider>();
    List<String> imageList = context.watch<ImageProviders>().images;
    bool deletingItemBusy = context.select(
        (ProductProvider productProvider) => productProvider.deleteBusy);
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
                  const VSpace(10),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.loc.products,
                          style: TextStyles.body1.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Visibility(
                          visible: productVewIndex == 0 ? false : true,
                          child: TextButton(
                              onPressed: () {
                                productVewIndex = 0;
                                setState(() {});
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      theme.primary.withOpacity(0.2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: Corners.s10Border)),
                              child: Text(
                                'See uploaded products',
                                style: TextStyles.body2,
                              )),
                        )
                      ],
                    ),
                  ),
                  const VSpace(10),
                  Expanded(
                    child: IndexedStack(
                      index: productVewIndex,
                      children: [
                        GridView.builder(
                            physics: const ClampingScrollPhysics(),
                            itemCount:
                                productProvider.myUploadedProducts.length + 1,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 6,
                                    mainAxisSpacing: 6,
                                    childAspectRatio: 0.8),
                            itemBuilder: (_, index) {
                              if (index == 0) {
                                return DashedRect(
                                  fChild: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_circle_rounded,
                                        color: Theme.of(context).primaryColor,
                                        size: 64,
                                      ),
                                      if (productProvider
                                          .myUploadedProducts.isEmpty) ...[
                                        const VSpace(5),
                                        Text(
                                          'You have no added product yet.\n tap to Add your product',
                                          textAlign: TextAlign.center,
                                          style: TextStyles.body1.copyWith(
                                              color: theme.primary,
                                              height: 1.4),
                                        )
                                      ]
                                    ],
                                  ),
                                ).clickable(() {
                                  productVewIndex = 1;
                                  setState(() {});

                                  log('go to add to product list screen');
                                });
                              } else {
                                return ClipRRect(
                                  borderRadius: Corners.s5Border,
                                  child: Stack(
                                    children: [
                                      ColoredBox(
                                        color: theme.dividerColor,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            BizUploadedProductItem(
                                              isNetWorkImage: true,
                                              addEditButton: true,
                                              imagesPath: productProvider
                                                  .myUploadedProducts[index - 1]
                                                  .images
                                                  .first,

                                              //remove product
                                              onTapRemoveItem: () {
                                                //set current index
                                                setState(() {
                                                  currentIndex = index;
                                                });

                                                //call endpoint after widget finish building due to setSate((){}) called
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  ProductCommand(context)
                                                      .deleteAddedProductOnBusinessProducts(
                                                          productProvider
                                                                  .myUploadedProducts[
                                                              index - 1]);
                                                });
                                              },
                                              onTapEditItem: () {
                                                context.push(
                                                    EditUploadedProductScreen(
                                                        product: productProvider
                                                                .myUploadedProducts[
                                                            index - 1]));
                                              },
                                            ),
                                            const VSpace(2),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "NGN${MoneyInputFormatter().toCurrencyString(productProvider.myUploadedProducts[index - 1].price.toString())}",
                                                    style:
                                                        TextStyles.body1.bold,
                                                  ),
                                                  const VSpace(2),
                                                  Text(
                                                      productProvider
                                                          .myUploadedProducts[
                                                              index - 1]
                                                          .name,
                                                      style: TextStyles.body1
                                                          .copyWith(
                                                              color:
                                                                  theme.grey)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (deletingItemBusy == true &&
                                          index == currentIndex) ...[
                                        Positioned(
                                          top: 0,
                                          bottom: 0,
                                          right: 0,
                                          left: 0,
                                          child: UnconstrainedBox(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: theme.greyTextFieldFill
                                                      .withOpacity(0.6),
                                                  borderRadius:
                                                      Corners.s5Border),
                                              height: 30,
                                              width: 30,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]
                                    ],
                                  ),
                                );
                              }
                            }),

                        ///this below Grid view builder is use for adding image to to a list that will be uploaded
                        GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount:
                                productProvider.uploadedProductsUrl.length + 2,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 6,
                                    mainAxisSpacing: 6,
                                    childAspectRatio: 1),
                            itemBuilder: (_, index) {
                              if (index == 0) {
                                return DashedRect(
                                  fChild: productProvider.isBusy
                                      ? const UnconstrainedBox(
                                          child: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 1,
                                              )),
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add_circle_rounded,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 64,
                                            ),
                                            const VSpace(5),
                                            Text(
                                              productProvider
                                                      .uploadedProductsUrl
                                                      .isNotEmpty
                                                  ? 'Add one more Image'
                                                  : 'Pick a product picture',
                                              style: TextStyles.body1
                                                  .txtColor(theme.primary),
                                            )
                                          ],
                                        ),
                                ).clickable(() async {
                                  await CustomBottomSheet.openBottomSheet(
                                      context,
                                      sizeFraction: 0.2,
                                      const ImagePickerChoice(
                                        useOnlyCamera: false,
                                        addImageToList: true,
                                      ));
                                  if (imageList.isNotEmpty && mounted) {
                                    log('Uploading new product.....');
                                    ProductCommand(context).upLoadProducts(
                                        imageList.first, onSuccessAction: () {
                                      context
                                          .read<ImageProviders>()
                                          .clearImagesPath();
                                    });
                                  }
                                  log('Add new product');
                                });
                              } else if (index == 1) {
                                return Visibility(
                                  visible: productProvider
                                          .uploadedProductsUrl.isEmpty
                                      ? false
                                      : true,
                                  child: DashedRect(
                                      fChild: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.cloud_upload_outlined,
                                        size: 40,
                                        color: theme.primary,
                                      ),
                                      Text(
                                        productProvider.uploadedProductsUrl
                                                    .length >
                                                1
                                            ? 'Save Added products'
                                            : 'Save Added product',
                                        style: TextStyles.body1
                                            .txtColor(theme.grey),
                                      )
                                    ],
                                  )).clickable(() {
                                    context
                                        .push(const CreateProductUploadInfo());
                                    //todo new products upload logic come here
                                  }),
                                );
                              } else {
                                return BizUploadedProductItem(
                                  isNetWorkImage: true,
                                  addEditButton: false,
                                  imagesPath: productProvider
                                      .uploadedProductsUrl[index - 2],
                                  onTapRemoveItem: () {
                                    context
                                            .read<ProductProvider>()
                                            .removeImageFromList =
                                        productProvider
                                            .uploadedProductsUrl[index - 2];
                                  },
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
} //

class BizUploadedProductItem extends StatefulWidget {
  const BizUploadedProductItem(
      {super.key,
      required this.imagesPath,
      this.isFileImage = false,
      this.isNetWorkImage = false,
      this.addEditButton = true,
      this.onTapRemoveItem,
      this.onTapEditItem});

  final String imagesPath;
  final bool isFileImage, isNetWorkImage, addEditButton;
  final Function()? onTapRemoveItem, onTapEditItem;
  @override
  State<BizUploadedProductItem> createState() => _BizUploadedProductItemState();
}

class _BizUploadedProductItemState extends State<BizUploadedProductItem> {
  bool showActionButtons = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Stack(
        children: [
          SizedBox(
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: Corners.s5Border,
                    child: widget.isFileImage
                        ? Image.file(
                            File(
                              widget.imagesPath,
                            ),
                            fit: BoxFit.cover,
                          )
                        : widget.isNetWorkImage
                            ? Image.network(
                                widget.imagesPath,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                widget.imagesPath,
                                fit: BoxFit.cover,
                              )),
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
              ],
            ),
          ),
          Positioned(
              top: 10,
              child: Visibility(
                visible: showActionButtons,
                child: Column(
                  children: [
                    const VSpace(20),
                    if (widget.addEditButton) ...[
                      Transform.scale(
                        scale: 0.7,
                        child: ColorBox(
                            onTap: () {
                              debugPrint('editing uploaded product');
                              showActionButtons = !showActionButtons;
                              setState(() {});
                              if (widget.onTapEditItem != null) {
                                widget.onTapEditItem!(); //
                              }
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
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13))
                              ],
                            )),
                      ),
                    ],
                    Transform.scale(
                      scale: 0.7,
                      child: ColorBox(
                          onTap: () {
                            debugPrint('removing uploaded product');

                            showActionButtons = !showActionButtons;
                            setState(() {});

                            if (widget.onTapRemoveItem != null) {
                              widget.onTapRemoveItem!();
                            }
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
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13))
                            ],
                          )),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class CreateProductUploadInfo extends StatefulWidget {
  const CreateProductUploadInfo({Key? key}) : super(key: key);

  @override
  State<CreateProductUploadInfo> createState() =>
      _CreateProductUploadInfoState();
}

class _CreateProductUploadInfoState extends State<CreateProductUploadInfo>
    with FormMixin {
  ProductModel model = ProductModel.init();
  String? selectedMenu;
  String? selectedTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = model.copyWith(
        images: ProductCommand(context).product.uploadedProductsUrl);
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    List<ProductCategoryModel> category =
        context.watch<ProductProvider>().productCategory;
    return Scaffold(
      appBar: CustomAppBar(
        onTapLeadingIcon: () {
          Navigator.of(context).pop();
          context.read<AuthProvider>().clearBusinessInfo();
        },
        titleWidget: Text(
          'Add Product information',
          style: TextStyles.h5
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 120),

          ///the 120 is the estimated appbar height and the page index indicator  taking them of allows the rest part of the screens to show up in the visible area
          child: Form(
            key: formKey,
            onChanged: () {
              validate(() {}, shouldUnFocus: false);
              // print(isFormValid);
            }, //
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      context.loc.name,
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

                CustomFormTextField(
                  type: InputType.txt,
                  validator: Validator.string(minLength: 2),
                  onChange: (name) {
                    model = model.copyWith(name: name);
                  },
                ),
                const VSpace(26),
                Row(
                  children: [
                    Text(
                      'Product price',
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
                CustomFormTextField(
                  // hintText: 'Product price',
                  type: InputType.num,
                  validator: Validator.amount(1),
                  onChange: (price) {
                    model = model.copyWith(price: double.parse(price));
                  },
                ),

                const VSpace(26),
                Row(
                  children: [
                    Text(
                      'choose product category',
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
                const VSpace(16),
                Theme(
                  data: Theme.of(context).copyWith(
                    highlightColor: Colors.transparent.withOpacity(0.02),
                  ),
                  child: PopupMenuButton<String>(
                    elevation: 2,
                    shadowColor: Colors.transparent.withOpacity(0.02),
                    initialValue: selectedMenu,
                    child: CustomContainer(
                      borderRadius: Corners.s8Border,
                      color: Colors.transparent,
                      border: Border.all(color: theme.greyWeak),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(selectedTitle ?? "Category"),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    // Callback that sets the selected popup menu item.
                    onSelected: (item) {
                      setState(() {
                        selectedMenu = item;
                        model = model.copyWith(category: selectedMenu ?? "");
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      ...List.generate(
                          category.length,
                          (index) => PopupMenuItem<String>(
                                onTap: () {
                                  selectedTitle = category[index].name;
                                },
                                value: category[index].id,
                                child: Text(category[index].name),
                              ))

                      // const PopupMenuItem<String>(
                      //   value: 's',
                      //   child: Text('Add to wishlist'),
                      // ),
                    ],
                  ),
                ),
                const VSpace(26),
                Row(
                  children: [
                    Text(
                      'Product Information',
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

                CustomReviewTextField(
                  // hintText: 'Product Information',
                  type: InputType.txt,
                  validator: Validator.string(minLength: 2),
                  onChange: (info) {
                    model = model.copyWith(info: info);
                  },
                  maxLines: 6,
                ),

                const VSpace(50),
                PrimaryButton(
                  onPressed: () {
                    validate(() {
                      load(() => ProductCommand(context)
                          .addProductToBusinessListOfProducts(model));
                    });
                  },
                  label: context.loc.save,
                  radius: 20,
                  fullWidth: true,
                  loading: isLoading,
                  color:
                      isFormValid == true ? theme.primary : Colors.transparent,
                  textColor: isFormValid == true ? Colors.white : theme.black,
                  borderColor: theme.primary.withOpacity(0.48),
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                )

                // VSpace(20),
              ], //
            ),
          ),
        ),
      ),
    );
  }
}
