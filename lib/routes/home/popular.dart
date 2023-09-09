import 'dart:math';

import 'package:chekinapp/export.dart';
import 'package:flutter/cupertino.dart';

import '../../components/msc/loader_state_widget.dart';
import '../../core/models/business_model.dart';
import '../../core/providers/business_provider.dart';

class Popular extends StatelessWidget {
  const Popular({
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
    List<BusinessModel> popular =
        context.select((BusinessProvider provider) => provider.popular);
    bool state = context.select((HomeProvider provider) => provider.isBusy);

    return SizedBox(
        height: 180,
        child: LoaderStateItem(
          key: UniqueKey(),
          isLoading: state,
          item: popular,
          widgetOnLoadSuccess: ListView.builder(
              itemCount: popular.length ~/ 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Row(
                    children: [
                      // BusinessItemCategory(
                      //   business: businesses[index],
                      //   color: colors[random.nextInt(colors.length)],
                      // ),
                    ],
                  )),
        ).center());
  }
}
