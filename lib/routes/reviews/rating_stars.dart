import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';

class StarRatingItem extends StatefulWidget {
  const StarRatingItem(
      {super.key,
      required this.ratings,
      this.onTapRating,
      this.startSize = 15});

  final String ratings;
  final double startSize;
  final Function(int val)? onTapRating;
  @override
  State<StarRatingItem> createState() => _StarRatingItemState();
}

class _StarRatingItemState extends State<StarRatingItem> {
  @override
  initState() {
    super.initState();
    generateEquivalentRating();
  }

  List<int> rateEquivalent = [];

  generateEquivalentRating({int? length}) {
    late int rating;
    if (length == null) {
      rating = double.parse(widget.ratings).toInt();
    } else {
      setState(() {
        rating = length;
      });
    }
    rateEquivalent = List.generate(rating, (index) => index);
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return InkWell(
            borderRadius: Corners.s8Border,
            onTap: widget.onTapRating == null
                ? () {
                    generateEquivalentRating(length: index + 1);
                  }
                : () {
                    generateEquivalentRating(length: index + 1);
                    widget.onTapRating!(index + 1);
                  },
            child: Icon(
              Icons.star_rounded,
              color: rateEquivalent.contains(index) == true
                  ? Colors.yellow.shade800
                  : theme.greyWeakTwo,
              size: widget.startSize,
            ),
          );
        }),
      ),
    );
  }
}
