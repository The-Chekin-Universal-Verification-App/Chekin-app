import 'dart:async';

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

class _AdvertSlider extends StatefulWidget {
  const _AdvertSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<_AdvertSlider> createState() => _AdvertSliderState();
}

class _AdvertSliderState extends State<_AdvertSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 6), (timer) {
      if (_currentPage < 4) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 850),
          curve: Curves.slowMiddle,
        );
      } else {
        _currentPage = 0;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 850),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

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
              itemCount: 4,
              controller: _pageController,
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
                4,
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
