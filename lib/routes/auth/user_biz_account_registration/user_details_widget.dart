import 'package:flutter/material.dart';
import 'package:lookapp/export.dart';

import '../../../components/input/base_text_input.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({Key? key}) : super(key: key);

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  @override
  void initState() {
    super.initState();
    _firstName.addListener(() {
      setState(() {});
    });
    _lastName.addListener(() {
      setState(() {});
    });
  }

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height - 120),

        ///the 120 is the estimated appbar height and the page index indicator  taking them of allows the rest part of the screens to show up in the visible area
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(23),
                Text(
                  context.loc.whatIsYourName,
                  style: TextStyles.h5,
                ),
                const VSpace(5),
                Text(
                  context.loc.tellUsYourName,
                  style: TextStyles.body1,
                ),
                const VSpace(42),
                Row(
                  children: [
                    Text(
                      context.loc.firstName,
                      style: TextStyles.body1
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      '*',
                      style: TextStyles.h5.copyWith(
                          height: 1.5,
                          color: theme.redButton,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                // VSpace(context.sp(5)),
                CustomFormTextField(
                  controller: _firstName,
                  suffix: _firstName.text.isNotEmpty
                      ? Icon(
                          Icons.cancel,
                          color: theme.black,
                        )
                      : const SizedBox.shrink(),
                  hintText: context.loc.noEmojis,
                ),
                const VSpace(25),
                Row(
                  children: [
                    Text(
                      context.loc.lastName,
                      style: TextStyles.body1
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      '*',
                      style: TextStyles.h5.copyWith(
                          height: 1.5,
                          color: theme.redButton,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                VSpace(context.sp(5)),
                CustomFormTextField(
                  controller: _lastName,
                  suffix: _lastName.text.isNotEmpty
                      ? Icon(
                          Icons.cancel,
                          color: theme.black,
                        )
                      : const SizedBox.shrink(),
                  hintText: context.loc.noEmojis,
                ),
                const VSpace(50),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 20.0,
              ),
              child: PrimaryButton(
                onPressed: () {},
                label: context.loc.conti,
                radius: 20,
                fullWidth: true,
                color: Colors.transparent,
                textColor: theme.black,
                borderColor: theme.primary.withOpacity(0.48),
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
            // VSpace(20),
          ], //
        ),
      ),
    );
  }
}

// return Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 27),
//   child: SingleChildScrollView(
//     physics: const BouncingScrollPhysics(),
//     child: SizedBox(
//       height: context.heightPx - 120,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 25, right: 27, left: 27),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(
//                     3,
//                     (index) => Flexible(
//                       flex: 1,
//                       child: CustomContainer(
//                         height: 5,
//                         duration: const Duration(milliseconds: 640),
//                         width: context.widthPx * 0.3,
//                         color: pageIndex == index
//                             ? theme.primary
//                             : Colors.blueGrey[100],
//                         borderRadius: BorderRadius.circular(10),
//                         margin: EdgeInsets.only(right: context.sp(5)),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const VSpace(23),
//               Text(
//                 context.loc.whatIsYourName,
//                 style: TextStyles.h5,
//               ),
//               const VSpace(5),
//               Text(
//                 context.loc.tellUsYourName,
//                 style: TextStyles.body1,
//               ),
//               const VSpace(42),
//               Row(
//                 children: [
//                   Text(
//                     context.loc.firstName,
//                     style: TextStyles.body1
//                         .copyWith(fontWeight: FontWeight.w900),
//                   ),
//                   Text(
//                     '*',
//                     style: TextStyles.h5.copyWith(
//                         height: 1.5,
//                         color: theme.redButton,
//                         fontWeight: FontWeight.w900),
//                   )
//                 ],
//               ),
//               VSpace(context.sp(5)),
//               CustomFormTextField(
//                 controller: _firstName,
//                 suffix: _firstName.text.isNotEmpty
//                     ? Icon(
//                         Icons.cancel,
//                         color: theme.black,
//                       )
//                     : const SizedBox.shrink(),
//               ),
//               const VSpace(25),
//               Row(
//                 children: [
//                   Text(
//                     context.loc.lastName,
//                     style: TextStyles.body1
//                         .copyWith(fontWeight: FontWeight.w900),
//                   ),
//                   Text(
//                     '*',
//                     style: TextStyles.h5.copyWith(
//                         height: 1.5,
//                         color: theme.redButton,
//                         fontWeight: FontWeight.w900),
//                   )
//                 ],
//               ),
//               VSpace(context.sp(5)),
//               CustomFormTextField(
//                 controller: _lastName,
//                 suffix: _lastName.text.isNotEmpty
//                     ? Icon(
//                         Icons.cancel,
//                         color: theme.black,
//                       )
//                     : const SizedBox.shrink(),
//               ),
//               const VSpace(50),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               bottom: 42.0,
//             ),
//             child: PrimaryButton(
//               onPressed: () {},
//               label: context.loc.conti,
//               radius: 20,
//               fullWidth: true,
//               color: Colors.transparent,
//               textColor: theme.black,
//               borderColor: theme.primary.withOpacity(0.48),
//               contentPadding: const EdgeInsets.symmetric(vertical: 18),
//             ),
//           )
//         ], //
//       ),
//     ),
//   ),
// );
