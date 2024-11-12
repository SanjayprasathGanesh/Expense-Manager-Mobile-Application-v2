import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final Function(double) onChanged;
  final double initialRating;

  StarRating({
    super.key,
    required this.onChanged,
    this.initialRating = 0.0,
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  void clearRating() {
    setState(() {
      _rating = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _rating = index + 1.0;
              widget.onChanged(_rating);
            });
          },
          child: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: index < _rating ? Colors.orange : Colors.black,
            size: 40.0,
          ),
        );
      }),
    );
  }
}
