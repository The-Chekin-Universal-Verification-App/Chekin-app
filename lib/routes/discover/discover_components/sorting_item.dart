import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

class SortingItem extends StatelessWidget {
  const SortingItem(
      {super.key, this.color, required this.onTap, required this.label});
  final Color? color;
  final String label;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: CustomContainer(
          padding: const EdgeInsets.all(15),
          borderRadius: Corners.s8Border,
          color: color?.withOpacity(.9) ?? Colors.transparent,
          border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.5)),
          child: Text(
            label,
            style: TextStyles.body1.copyWith(
                fontWeight: FontWeight.w500,
                color: color != null ? Colors.white : Colors.black),
          ),
        ).rippleClick(onTap, padding: EdgeInsets.zero),
      ),
    );
  }
}
