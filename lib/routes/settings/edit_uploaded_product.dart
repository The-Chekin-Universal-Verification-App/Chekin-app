import 'package:chekinapp/export.dart';

import '../../components/input/base_text_input.dart';
import '../../core/commands/product_command.dart';
import 'package:flutter/material.dart';

import '../../core/providers/product_provider.dart';
import '../../utils/imagepicker/image_picker_choice.dart';
import '../../utils/imagepicker/provider/image_provider.dart';
import '../document_upload/upload_valid_ids.dart';
import 'business_account_profile.dart';

class EditUploadedProductScreen extends StatefulWidget {
  const EditUploadedProductScreen({Key? key, required this.product})
      : super(key: key);
  final ProductModel product;
  @override
  State<EditUploadedProductScreen> createState() =>
      _EditUploadedProductScreenState();
}

class _EditUploadedProductScreenState extends State<EditUploadedProductScreen>
    with FormMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  ProductModel model = ProductModel.init();
  String? selectedMenu;
  String? selectedTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = model.copyWith(
        id: widget.product.id,
        images: widget.product.images,
        name: widget.product.name,
        info: widget.product.info,
        price: widget.product.price,
        category: widget.product.category);
    selectedMenu = widget.product.category;
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    List<ProductCategoryModel> category =
        context.watch<ProductProvider>().productCategory;
    //the image path selected
    ProductProvider productProvider = context.watch<ProductProvider>();
    List<String> imageList = context.watch<ImageProviders>().images;

    return Scaffold(
      appBar: CustomAppBar(
        onTapLeadingIcon: () {
          Navigator.of(context).pop();
          context.read<AuthProvider>().clearBusinessInfo();
        },
        titleWidget: Text(
          'Edit Product information',
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
                const VSpace(20),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: model.images.length + 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        if (index == 0) {
                          return SizedBox(
                            width: 120,
                            child: DashedRect(
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
                                          color: Theme.of(context).primaryColor,
                                          size: 64,
                                        ),
                                        if (productProvider.uploadedProductsUrl
                                            .isNotEmpty) ...[
                                          const VSpace(5),
                                          Text(
                                            'Add one more Image',
                                            textAlign: TextAlign.center,
                                            style: TextStyles.body1
                                                .txtColor(theme.primary),
                                          )
                                        ]
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
//
                                  ///this would be use to add image to the list
                                  ///only when image was uploaded successfully to storage bucket
                                  if (productProvider
                                      .uploadedProductsUrl.isNotEmpty) {
                                    List<String> editedImages = model.images
                                        .map((e) => e.toString())
                                        .toList();
                                    editedImages.add(productProvider
                                        .uploadedProductsUrl.first);

                                    model =
                                        model.copyWith(images: editedImages);
                                    setState(() {});

                                    ///clear what has been uploaded from the [uploadedProductsUrl] list
                                    context
                                        .read<ProductProvider>()
                                        .clearImageFromList();
                                  }
                                });
                              }
                              log('Add new product');
                            }),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: ClipRRect(
                            borderRadius: Corners.s5Border,
                            child: SizedBox(
                              height: 120,
                              child: Stack(
                                // alignment: Alignment.center,
                                children: [
                                  Image.network(model.images[index - 1]),
                                  Positioned(
                                    top: 5,
                                    right: 10,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor:
                                          theme.redButton.withOpacity(0.8),
                                      child: Icon(
                                        Icons.remove,
                                        color: theme.greyTextFieldFill,
                                      ),
                                    ).clickable(() {
                                      if (model.images.length == 1) {
                                        DialogServices.messageModalFromTop(
                                            context,
                                            message:
                                                'You can not remove all images ',
                                            notificationType:
                                                NotificationType.error);
                                      } else {
                                        List<String> editedImages = model.images
                                            .map((e) => e.toString())
                                            .toList();
                                        editedImages.removeAt(index - 1);

                                        model = model.copyWith(
                                            images: editedImages);
                                        setState(() {});
                                      }
                                    }),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const VSpace(20),
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
                  initialValue: model.name,
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
                  initialValue: model.price.toString(),
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
                  initialValue: model.info,
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
                          .editAddedProductOnBusinessProducts(model));
                    });
                  }, //
                  label: context.loc.save,
                  radius: 20,
                  fullWidth: true,
                  loading: isLoading,
                  color:
                      isFormValid == true ? theme.primary : Colors.transparent,
                  textColor: isFormValid == true ? Colors.white : theme.black,
                  borderColor: theme.primary.withOpacity(0.48),
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                ),
                const VSpace(25),
              ], //
            ),
          ),
        ),
      ),
    );
  }
}
