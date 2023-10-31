import 'dart:math';

import 'package:chekinapp/export.dart';
import 'package:chekinapp/routes/home/top_rated.dart';
import 'package:flutter/cupertino.dart';

import '../../components/msc/loader_state_widget.dart';
import '../../core/models/business_model.dart';
import '../../core/providers/business_provider.dart';
import 'business_item_category.dart';

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
    bool state = context.select((BusinessProvider provider) => provider.isBusy);
    List<BusinessModel> popular = context.watch<BusinessProvider>().popular;
    // print(popular.length);
    return SizedBox(
        height: 180,
        child: LoaderStateItem(
          key: UniqueKey(),
          isLoading: state,
          item: popular,
          widgetOnLoadSuccess: ListView.builder(
              itemCount: popular.length > 10 ? 10 : popular.length,
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Row(
                    children: [
                      BusinessItemCategory(
                        businessModel: popular[index],
                        color: colors[random.nextInt(colors.length)],
                      ),
                    ],
                  )),
        ).center());
  }
}
