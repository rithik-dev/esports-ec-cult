import 'package:easy_container/easy_container.dart';
import 'package:esports_ec/models/trainer.dart';
import 'package:esports_ec/widgets/my_cached_network_image.dart';
import 'package:esports_ec/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class TrainerCard extends StatelessWidget {
  static const id = 'TrainerCard';

  final Trainer trainer;

  const TrainerCard(
    this.trainer, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      margin: 0,
      onTap: () {},
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: MyCachedNetworkImage(
              url: trainer.image,
              padding: 0,
              height: 225,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            trainer.name,
            style: const TextStyle(fontSize: 20),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          RatingBar(rating: trainer.rating),
        ],
      ),
    );
  }
}
