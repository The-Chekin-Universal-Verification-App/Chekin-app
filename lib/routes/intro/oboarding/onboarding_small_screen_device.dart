import 'package:chekinapp/routes/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/res/language_and_emojis.dart';
import 'package:chekinapp/routes/intro/select_usertype/set_a_user_type.dart';
import 'package:tuple/tuple.dart';
import '../../../utils/helpers/app_language.dart';

class OnBoardingSmallScreen extends StatelessWidget {
  const OnBoardingSmallScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    List onboards = R.M.getOnboards(context);
    return Selector<AppProvider, Tuple2<int, Language>>(
      selector: (_, provider) =>
          Tuple2(provider.onBoardPageIndex, provider.language),
      builder: (_, data, __) => Scaffold(
        appBar: CustomAppBar(
          onTapLeadingIcon: () {},
          leadingIcon: const LogoIconItem(),
          trailing: const [SelectLanguageWidget()],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  clipBehavior: Clip.none,
                  pageSnapping: true,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (val) {
                    context.read<AppProvider>().setOnBoardPageIndex = val;
                  },
                  children: [
                    BoardingPages(
                      onboards: onboards,
                      index: 0,
                    ),
                    BoardingPages(
                      onboards: onboards,
                      index: 1,
                    ),
                    BoardingPages(
                      onboards: onboards,
                      index: 2,
                    ),
                  ],
                ),
              ),
              // const VSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboards.length,
                  (index) => CustomContainer(
                    height: 5,
                    duration: const Duration(milliseconds: 640),
                    width: data.item1 == index ? 80 : 20,
                    color: data.item1 == index
                        ? theme.primary
                        : Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(10),
                    margin: const EdgeInsets.only(right: 5, top: 20),
                  ),
                ),
              ),
              const VSpace(44),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Wrap(
                  runSpacing: 15,
                  children: [
                    PrimaryButton(
                      onPressed: () {
                        SharedPrefs.setBool('isFirstTime', false);
                        context.push(const LogInScreen());
                      },
                      label: context.loc.login,
                      radius: 20,
                      fullWidth: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                    const VSpace(10),
                    PrimaryButton(
                      onPressed: () {
                        SharedPrefs.setBool('isFirstTime', false);

                        context.push(const SetUserTypeScreen());
                      },
                      label: context.loc.singMeUp,
                      radius: 20,
                      fullWidth: true,
                      color: Colors.transparent,
                      textColor: theme.black,
                      borderColor: theme.primary.withOpacity(0.48),
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                    const VSpace(55),
                    const TermsAndConditionWidget()
                  ],
                ),
              ),
              const VSpace(41),
            ],
          ),
        ),
      ),
    );
  }
}

class BoardingPages extends StatelessWidget {
  const BoardingPages({Key? key, required this.onboards, required this.index})
      : super(key: key);

  final List onboards;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: onboards[index]['page'],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: Insets.l, right: Insets.l, top: Insets.l),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 20),
                      child: Text(
                        onboards[index]['title'],
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.h4.copyWith(
                          fontSize: 25, fontWeight: FontWeight.w400,
                          color: Colors.black, //
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 20),
                      child: Text(
                        " ${R.S.appName}",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.h4.copyWith(
                          fontSize: 25, fontWeight: FontWeight.w800,
                          color: Colors.black, //
                        ),
                      ),
                    ),
                  ],
                ),
                const VSpace(9),
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 20),
                  child: Text(
                    onboards[index]['subtitle'],
                    style: TextStyles.body1
                        .copyWith(height: 1.2, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
