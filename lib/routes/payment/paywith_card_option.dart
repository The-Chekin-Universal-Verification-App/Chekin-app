import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/input/base_text_input.dart';
import 'confirmedPayment_screen.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  TextEditingController cardNumberController = TextEditingController();

  CardType cardType = CardType.Invalid;

  // Whenever the credit card text field changes, we must run the getCardTypeFrmNumber method. You can do this by adding a listener to the cardNumberController on initState.

  @override
  void initState() {
    cardNumberController.addListener(
      () {
        getCardTypeFrmNumber();
      },
    );
    super.initState();
  }
  // Don’t forget to dispose of it.

  @override
  void dispose() {
    cardNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: true,
        titleWidget: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 30),
          child: const LogoIconItem(allRoundPadding: 1),
        ),
        trailing: [
          UnconstrainedBox(
            child: CustomContainer(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(5),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: theme.primary,
              ),
              child: CircleAvatar(
                backgroundColor: theme.black,
                child: const Icon(
                  Icons.question_mark_rounded,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const HSpace(20)
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Insets.l),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VSpace(23),
                    Text(
                      context.loc.payment,
                      style: TextStyles.h5,
                    ),
                    const VSpace(5),
                    Text(
                      context.loc.choosePaymentMethod,
                      style: TextStyles.body1,
                    ),
                    const VSpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColorBox(
                          onTap: () {},
                          borderRadius: Corners.s20Border,
                          color: theme.primary,
                          child: Text(
                            context.loc.addPaymentMethod,
                            style: TextStyles.body1.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              context.loc.paying,
                              style: TextStyles.body1.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            const VSpace(8),
                            Text(
                              '₦50,562.00',
                              style: TextStyles.body1,
                            ),
                          ],
                        )
                      ],
                    ),
                    const VSpace(30),
                    Form(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                context.loc.cardNumber,
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
                          CustomFormTextField(
                            controller: cardNumberController,
                            type: InputType.num,
                            formatter: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(19),
                              CardNumberInputFormatter(),
                            ],
                            // decoration: InputDecoration(
                            // suffix: Icon(Icons.cabin),
                            suffix: CardUtils.getCardIcon(cardType),
                            // ),
                          ),
                          VSpace(context.sp(25)),
                          Row(
                            children: [
                              Text(
                                context.loc.cardHolderName,
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
                          CustomFormTextField(),
                          const VSpace(25),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          context.loc.cardExpires,
                                          style: TextStyles.body1.copyWith(
                                              fontWeight: FontWeight.w900),
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
                                    CustomFormTextField(
                                      // keyboardType: TextInputType.number,
                                      formatter: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(5),
                                        CardMonthInputFormatter(),
                                      ],
                                      // decoration:
                                      //     const InputDecoration(hintText: "MM/YY"),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          context.loc.cvv,
                                          style: TextStyles.body1.copyWith(
                                              fontWeight: FontWeight.w900),
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
                                    CustomFormTextField(
                                      // keyboardType: TextInputType.number,
                                      formatter: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        // Limit the input
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                      // decoration: const InputDecoration(hintText: "CVV"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: PrimaryButton(
                    onPressed: () {
                      context.push(const ConfirmedPaymentScreen());
                    },
                    label: context.loc.pay,
                    fullWidth: true,
                    radius: Corners.s20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // In this class, lets define a method that lets us know the card type and updates it accordingly.

  void getCardTypeFrmNumber() {
    if (cardNumberController.text.length <= 6) {
      String input = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }
}

///Then go back to the credit card TextFormField and add CardNumberInputFormatter to inputFormatters.
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

/// We need to do something similar for expire date, but instead of spaces we need a slash.
class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

/// The next step is identifying the card type, whether it is a Visa, Mastercard, or something else. Would love to have it under CardUtils.

class CardUtils {
  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.Master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.Visa;
    } else if (input.startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = CardType.Verve;
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = CardType.AmericanExpress;
    } else if (input.startsWith(RegExp(r'((6[45])|(6011))'))) {
      cardType = CardType.Discover;
    } else if (input.startsWith(RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = CardType.DinersClub;
    } else if (input.startsWith(RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = CardType.Jcb;
    } else if (input.length <= 8) {
      cardType = CardType.Others;
    } else {
      cardType = CardType.Invalid;
    }
    return cardType;
  }

  /// Knowing the type of credit card, it’s pretty easy to show its logo.

  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case CardType.Master:
        img = 'mastercard.png';
        break;
      case CardType.Visa:
        img = 'visa.png';
        break;
      case CardType.Verve:
        img = 'verve_card.png';
        break;
      case CardType.AmericanExpress:
        img = 'america_express.png';
        break;
      case CardType.Discover:
        img = 'discover_card.png';
        break;
      case CardType.DinersClub:
        img = 'diners_club_card.png';
        break;
      case CardType.Jcb:
        img = 'jcb.png';
        break;
      case CardType.Others:
        icon = const Icon(
          Icons.credit_card,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
      default:
        icon = const Icon(
          Icons.warning,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'assets/images/$img',
        width: 40.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  // To improve user experience, we use double spaces after 4 digits on the card number. The card number needs to be without those double spaces, so we’ll define a method called getCleanedNumber.
  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  /// With the card number with Luhn Algorithm
  /// https://en.wikipedia.org/wiki/Luhn_algorithm
  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return "This field is required";
    }
    input = getCleanedNumber(input);
    if (input.length < 8) {
      return "Card is invalid";
    }
    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);
// every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }
    if (sum % 10 == 0) {
      return null;
    }
    return "Card is invalid";
  }

  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    int year;
    int month;
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));

      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }
    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }
    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }
    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }
}
