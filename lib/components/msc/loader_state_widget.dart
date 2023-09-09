import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';

import '../../core/commands/product_command.dart';

class LoaderStateItem extends StatefulWidget {
  const LoaderStateItem({
    Key? key,
    required this.isLoading,
    required this.item,
    required this.widgetOnLoadSuccess,
    this.onListEmptyWidget,
    this.onRefreshNoData,
  }) : super(key: key);
  final bool isLoading;
  final List<dynamic> item;
  final Widget widgetOnLoadSuccess;
  final Widget? onListEmptyWidget;
  final Future<void> Function()? onRefreshNoData;
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
      return RefreshIndicator(
        onRefresh: widget.onRefreshNoData ?? () async {},
        child: Center(
          child: SingleChildScrollView(
              child: widget.onListEmptyWidget ??
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.09),
                          radius: 26,
                          child: SvgIcon(
                            R.png.document.svg,
                            color: Colors.grey.shade500,
                          )),
                      const VSpace(10),
                      Text(
                        context.loc.noData,
                        style: TextStyles.body1,
                      ),
                    ],
                  )),
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
