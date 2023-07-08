import 'package:chekinapp/export.dart';
import 'package:flutter/cupertino.dart';

class AdvertSlider extends StatelessWidget {
  const AdvertSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderProvider(),
      child: const _AdvertSlider(),
    );
  }
}

class _AdvertSlider extends StatelessWidget {
  const _AdvertSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    int sliderIndex =
        context.select((SliderProvider slider) => slider.currentPage);
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: PageView.builder(
              itemCount: 5,
              onPageChanged: (val) {
                context.read<SliderProvider>().currentPage = val;
              },
              itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(R.png.advert.imgPng),
                  )),
        ),
        SizedBox(
          height: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (index) => CustomContainer(
                      borderRadius: Corners.s8Border,
                      color: index == sliderIndex
                          ? theme.primary
                          : theme.primary.withOpacity(0.15),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 5,
                      width: index == sliderIndex ? context.sp(20) : 18,
                    )),
          ),
        ),
      ],
    );
  }
}

class SliderProvider extends BaseProvider {
  int get currentPage => _currentPage;
  int _currentPage = 0;
  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }
}
