import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

class LoaderStateItem extends StatefulWidget {
  const LoaderStateItem({
    Key? key,
    required this.isLoading,
    required this.item,
    required this.widgetOnLoadSuccess,
    this.onListEmptyWidget,
  }) : super(key: key);
  final bool isLoading;
  final List<dynamic> item;
  final Widget widgetOnLoadSuccess;
  final Widget? onListEmptyWidget;

  @override
  State<LoaderStateItem> createState() => _LoaderStateItemState();
}

class _LoaderStateItemState extends State<LoaderStateItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading == true) {
      return UnconstrainedBox(
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            color: Theme.of(context).primaryColor.withOpacity(0.2),
          ),
        ),
      );
    } else if (widget.isLoading == false && widget.item.isEmpty) {
      return Center(
        child: widget.onListEmptyWidget ??
            Text(
              context.loc.noData,
              style: TextStyles.body1,
            ),
      );
    } else if (widget.isLoading == false && widget.item.isNotEmpty) {
      return widget.widgetOnLoadSuccess;
    } else {
      return Center(
        child: Text(
          context.loc.errorOccurred,
          style: TextStyles.body1,
        ),
      );
    }
  }
}

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgIcon(
          R.png.brokenHeart.svg,
          color: theme.redButton,
        ),
        const VSpace(5),
        Text(
          context.loc.noWishList,
          style: TextStyles.body1,
        ),
      ],
    );
  }
}
