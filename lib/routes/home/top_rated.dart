import 'dart:math';

import 'package:chekinapp/export.dart';
import 'package:flutter/cupertino.dart';

import '../../components/msc/loader_state_widget.dart';
import '../../core/models/business_model.dart';
import '../../core/providers/business_provider.dart';
import '../business/businesses.dart';
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
        context.select((HomeProvider provider) => provider.popular);
    bool state = context.select((HomeProvider provider) => provider.isBusy);
    List<BusinessModel> businesses = context
        .select((BusinessProvider business) => business.allAvailableBusiness);

    return SizedBox(
        height: 180,
        child: LoaderStateItem(
          key: UniqueKey(),
          isLoading: state,
          item: businesses,
          widgetOnLoadSuccess: ListView.builder(
              itemCount: businesses.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Row(
                    children: [
                      // BusinessItemCategory(
                      //   business: businesses[index],
                      //   color: colors[random.nextInt(colors.length)],
                      // ),
                      Text('data')
                    ],
                  )),
        ).center());
  }
}
