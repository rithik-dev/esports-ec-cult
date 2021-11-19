import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  static const id = 'RatingBar';

  final double rating;

  const RatingBar({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 17.5,
          ),
          const SizedBox(width: 5),
          Text(
            rating.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      margin: 0,
      color: Colors.white,
      borderRadius: 10,
      alignment: null,
      customPadding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 2.5,
      ),
    );
  }
}
