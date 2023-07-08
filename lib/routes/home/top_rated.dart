import 'dart:math';

import 'package:chekinapp/export.dart';
import 'package:flutter/cupertino.dart';

import '../../components/msc/loader_state_widget.dart';
import 'home.dart';

class TopRated extends StatelessWidget {
  const TopRated({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Random random = Random(10);
    List<Color> colors = [
      Color(0xFCF9BFC9),
      Color(0xffCCE4FF),
      Color(0xffD4FFE8),
    ];
    List<ProductModel> homeProvider =
        context.select((HomeProvider provider) => provider.topRated);
    bool state = context.select((HomeProvider provider) => provider.isBusy);
    return SizedBox(
        height: 180,
        child: LoaderStateItem(
          key: UniqueKey(),
          isLoading: state,
          item: homeProvider,
          widgetOnLoadSuccess: ListView.builder(
              itemCount: homeProvider.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Row(
                    children: [
                      ProductItem(
                        product: homeProvider[index],
                        color: colors[random.nextInt(colors.length)],
                      ),
                    ],
                  )),
        ));
  }
}
