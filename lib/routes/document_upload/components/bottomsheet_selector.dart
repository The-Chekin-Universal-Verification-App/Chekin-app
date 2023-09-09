import 'package:chekinapp/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetSelector extends StatefulWidget {
  const CustomBottomSheetSelector(
      {super.key, this.onSelectItem, required this.items, this.heightFraction});

  ///the desired height of the bottom sheet from[0-1]
  final double? heightFraction;
  final Function(dynamic selectedItem)? onSelectItem;
  final List<String> items;
  @override
  State<CustomBottomSheetSelector> createState() =>
      _CustomBottomSheetSelectorState();
}

class _CustomBottomSheetSelectorState extends State<CustomBottomSheetSelector> {
  String selectedValue = 'Value';

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: context.sp(10)),
      decoration: BoxDecoration(
          border: Border.all(
            color: theme.primary,
          ),
          borderRadius: Corners.s20Border),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedValue,
            style: TextStyles.body1,
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 30,
          )
        ],
      ),
    ).clickable(() {
      showModalBottomSheet(
          // elevation: 1,
          barrierColor: const Color(0xff969691).withOpacity(0.57),
          shape: RoundedRectangleBorder(borderRadius: Corners.s8Border),
          context: context,
          builder: (_) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: widget.heightFraction != null
                        ? (context.heightPx * widget.heightFraction!)
                        : context.heightPx * 0.3,
                    child: ListView.builder(
                        itemCount: widget.items.length,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (_, index) {
                          String? selected;
                          return Center(
                              child: GestureDetector(
                            onTap: () {
                              if (widget.onSelectItem != null) {
                                widget.onSelectItem!(widget.items[index]);
                              } else {
                                selected = widget.items[index];
                              }
                              selectedValue = widget.items[index];
                              setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: Material(
                              color: selected == widget.items[index]
                                  ? theme.redButton
                                  : Colors.transparent,
                              borderRadius: Corners.s10Border,
                              child: Container(
                                margin: const EdgeInsets.only(top: 8),
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  widget.items[index],
                                  style: TextStyles.h5.copyWith(
                                      color: theme.greyWeak,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ));
                        }),
                  )
                ],
              ));
    });
  }
}
